module Jekyll
  class Thumbnail < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @name = text.strip
    end
    def lookup(context, name)
      lookup = context
      name.split(".").each { |value| lookup = lookup[value] }
      lookup
    end
    def render(context)
      base_url = lookup(context, 'site.url')
      name = @name
      <<-eos
<a href="#" class="thumbnail">
  <img src="#{base_url}/assets/screenshots/#{name}.png" />
</a>
eos
    end
  end
end

Liquid::Template.register_tag('thumbnail', Jekyll::Thumbnail)
