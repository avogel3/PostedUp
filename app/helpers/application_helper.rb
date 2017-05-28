module ApplicationHelper
    def markdown text
        renderer_with_syntax = CodeRaySyntaxHighlight.new(filter_html: true, hard_wrap: true)

        optional_plugins = {
            no_intra_emphasis: true,
            fenced_code_blocks: true,
            autolink: true,
            lax_html_blocks: true,
            tables: true,
            disable_indented_code_blocks: true,
            strikethrough: true,
            lax_spacing: true,
            underline: true,
            highlight: true,
            footnotes: true                               
        }
        
        markdown = Redcarpet::Markdown.new(renderer_with_syntax, optional_plugins)
        return markdown.render(text).html_safe
    end

    private
    class CodeRaySyntaxHighlight < Redcarpet::Render::HTML
        # Monkey patch block_code method of RedCarpet to inject syntax highlighting on render
        # Credit to CodeFellows.org for the idea
        def block_code(code, language)
            CodeRay.scan(code, language).div(line_numbers: :table)
        end
    end
end
