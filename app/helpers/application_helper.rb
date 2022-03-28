module ApplicationHelper

  def markdown(text)
    options = {
      hard_wrap: true,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown_to_html.render(text).html_safe
  end
end
