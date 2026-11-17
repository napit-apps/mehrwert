# Validate the content used by shared templates before Liquid can silently fall
# back to another language. Both language files are the complete content contract.
module MehrwertI18nContract
  module_function

  # YAML normally accepts duplicate keys and silently keeps the last value.
  def load_content(file)
    inspect_keys = lambda do |node|
      if node.is_a?(Psych::Nodes::Mapping)
        keys = node.children.each_slice(2).map { |key, _| key.value }
        duplicates = keys.tally.select { |_, count| count > 1 }.keys
        unless duplicates.empty?
          raise Jekyll::Errors::FatalException, "Duplicate i18n keys in #{file}: #{duplicates.join(', ')}"
        end
      end
      (node.children || []).each { |child| inspect_keys.call(child) }
    end
    inspect_keys.call(Psych.parse_file(file))
    YAML.load_file(file)
  end

  def compare(reference, translated, path, errors, unpublished = false)
    case reference
    when Hash
      unless translated.is_a?(Hash)
        errors << path
        return
      end
      (translated.keys - reference.keys).each { |key| errors << "#{path}.#{key} (unexpected key)" }
      unpublished ||= translated['published'] == false
      reference.each { |key, value| compare(value, translated[key], "#{path}.#{key}", errors, unpublished) }
    when Array
      unless translated.is_a?(Array) && translated.size == reference.size
        errors << "#{path} (expected #{reference.size} items)"
        return
      end
      reference.each_with_index { |value, i| compare(value, translated[i], "#{path}[#{i}]", errors, unpublished) }
    when String
      errors << path unless translated.is_a?(String) && (unpublished || reference.empty? || !translated.strip.empty?)
    when TrueClass, FalseClass
      errors << path unless translated == true || translated == false
    else
      errors << path unless translated.is_a?(reference.class)
    end
  end

  # Published quotations reference existing verbatim source records, never a
  # cross-language fallback. Missing approved records must stop the build.
  def validate_testimonial_sources(node, data, path, errors)
    case node
    when Hash
      if node['source_key'] && node['published']
        group = data.dig('common', 'testimonials', node['source_key']) || {}
        items = group['published'] == false ? [] : (group['item'] || [])
        errors << "#{path} (testimonial source missing)" unless items.any? { |item| item['author'] == node['source_author'] && !item['text'].to_s.empty? }
      end
      node.each { |key, value| validate_testimonial_sources(value, data, "#{path}.#{key}", errors) }
    when Array
      node.each_with_index { |value, index| validate_testimonial_sources(value, data, "#{path}[#{index}]", errors) }
    end
  end

  def validate_review(entries, data, language, errors)
    entries.each do |entry|
      key = entry.fetch('key')
      value = key.split('.').reduce(data) do |node, part|
        if node.is_a?(Array) && part.match?(/\A\d+\z/)
          node[part.to_i]
        elsif node.is_a?(Hash)
          node[part]
        end
      end
      errors << "#{language}.#{key} (review source missing)" unless value.is_a?(String)
    end
  end

  def validate(site)
    languages = site.config.fetch('languages')
    reference = load_content(File.join(site.source, '_i18n', "#{site.config.fetch('default_lang')}.yml"))
    review = YAML.load_file(File.join(site.source, '_data', 'translation_review.yml'))
    languages.each do |language|
      translated = load_content(File.join(site.source, '_i18n', "#{language}.yml"))
      errors = []
      compare(reference, translated, language, errors)
      validate_testimonial_sources(translated, translated, language, errors)
      validate_review(review.fetch('entries'), translated, language, errors)
      unless errors.empty?
        raise Jekyll::Errors::FatalException, "Missing or incompatible i18n keys:\n#{errors.join("\n")}"
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  MehrwertI18nContract.validate(site)
end
