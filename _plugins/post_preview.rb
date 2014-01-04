module Jekyll
  module PostPreviewFilter
    def post_preview(input)
      parts = input.split("<!--more-->")
      parts.length > 1 ? parts.first : ''
    end
  end
end

Liquid::Template.register_filter(Jekyll::PostPreviewFilter)
