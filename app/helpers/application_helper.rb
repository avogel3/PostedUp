module ApplicationHelper
  def markdown(text)
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
    markdown.render(text).html_safe
  end

  def parse_time_for_post(posted_at, timezone)
    Time.use_zone(timezone) { posted_at.strftime('%b %d %Y %H:%M %Z') }
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
