module Jekyll
  class EndPreviewTag < Liquid::Tag
    def render(context)
      "<!--more-->"
    end
  end
end

Liquid::Template.register_tag('endpreview', Jekyll::EndPreviewTag)

