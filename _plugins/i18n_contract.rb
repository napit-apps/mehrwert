# Validate the content used by shared templates before Liquid can silently fall
# back to another language. Legacy editorial fields remain in de.yml for history.
module MehrwertI18nContract
  module_function

  def active_content(data)
    active = Marshal.load(Marshal.dump(data.fetch('relaunch')))
    pages = active.fetch('pages')
    pages.fetch('strategy').delete('practice')
    pages.fetch('delivery').delete('practice')
    pages.fetch('delivery').fetch('ai').delete('closing')
    %w[duecker viridium hugo-boss mywork-produktverantwortung technische-fuehrung-web-mobile green-agile-guide enbw contact].each do |key|
      pages[key].select! { |field, _| %w[title meta_title description url case_study].include?(field) }
    end
    pages.fetch('projects').fetch('entries').each do |key, entry|
      entry.select! { |field, _| %w[meta_title description].include?(field) } unless key == 'mobile-software-projekte'
    end
    result = { 'relaunch' => active }
    %w[shared_ui page_title page_description blog-landing blog-search contact contact_blog ac_testimonials error gsp_training contact_training].each do |key|
      result[key] = data.fetch(key)
    end
    result
  end

  def compare(reference, translated, path, errors)
    case reference
    when Hash
      unless translated.is_a?(Hash)
        errors << path
        return
      end
      reference.each { |key, value| compare(value, translated[key], "#{path}.#{key}", errors) }
    when Array
      unless translated.is_a?(Array) && translated.size == reference.size
        errors << "#{path} (expected #{reference.size} items)"
        return
      end
      reference.each_with_index { |value, i| compare(value, translated[i], "#{path}[#{i}]", errors) }
    when String
      errors << path unless translated.is_a?(String) && (reference.empty? || !translated.strip.empty?)
    else
      errors << path if translated.nil? && !reference.nil?
    end
  end

  # Published quotations reference existing verbatim source records, never a
  # cross-language fallback. Missing approved records must stop the build.
  def validate_testimonial_sources(node, data, path, errors)
    case node
    when Hash
      if node['source_key'] && node['published']
        items = data.dig(node['source_key'], 'item') || []
        errors << "#{path} (testimonial source missing)" unless items.any? { |item| item['author'] == node['source_author'] && !item['text'].to_s.empty? }
      end
      node.each { |key, value| validate_testimonial_sources(value, data, "#{path}.#{key}", errors) }
    when Array
      node.each_with_index { |value, index| validate_testimonial_sources(value, data, "#{path}[#{index}]", errors) }
    end
  end

  def validate(site)
    languages = site.config.fetch('languages')
    source = YAML.load_file(File.join(site.source, '_i18n', "#{site.config.fetch('default_lang')}.yml"))
    reference = active_content(source)
    languages.each do |language|
      translated = YAML.load_file(File.join(site.source, '_i18n', "#{language}.yml"))
      errors = []
      compare(reference, translated, language, errors)
      validate_testimonial_sources(translated['relaunch'], translated, language, errors)
      unless errors.empty?
        raise Jekyll::Errors::FatalException, "Missing or incompatible i18n keys:\n#{errors.join("\n")}"
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  MehrwertI18nContract.validate(site)
end
