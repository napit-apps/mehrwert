module MehrwertUrls
  def localized_url(value)
    path = value.to_s
    return path unless path.start_with?("/") && !path.start_with?("//")
    site = @context.registers[:site]
    if site.config['lang'] == 'en'
      route, fragment = path.split('#', 2)
      pair = (site.data['blog_language_routes'] || []).find { |item| item['de'] == route }
      path = pair['en'] + (fragment ? "##{fragment}" : '') if pair
    end
    site.config['baseurl'].to_s + path
  end

  # Older Markdown posts contain root-relative asset attributes. Adapt only
  # these technical paths at render time; leave article sources and prose intact.
  def content_asset_urls(value)
    root = @context.registers[:site].config['baseurl_root'].to_s
    return value if root.empty?
    value.to_s.gsub(/(\b(?:src|href)=["'])\/assets\//) { "#{$1}#{root}/assets/" }
  end

  def asset_url(value)
    path = value.to_s
    return path unless path.start_with?("/") && !path.start_with?("//")
    @context.registers[:site].config['baseurl_root'].to_s + path
  end
end
Liquid::Template.register_filter(MehrwertUrls)
