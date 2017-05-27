module ApplicationHelper

    def markdown text
        renderer = Redcarpet::Render::HTML
        markdown = Redcarpet::Markdown.new(renderer,
                                            no_intra_emphasis: true,
                                            tables: true,
                                            fenced_code_blocks: true,
                                            disable_indented_code_blocks: true,
                                            striekthrough: true,
                                            lax_spacing: true,
                                            autolink: true,
                                            underline: true,
                                            highlight: true,
                                            footnotes: true
                                        )
        return markdown.render(text).html_safe
    end
end
