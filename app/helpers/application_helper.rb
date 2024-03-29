# frozen_string_literal: true

module ApplicationHelper
  def markdown(text)
    return '' if text.blank?

    options = { hard_wrap: true,
                autolink: true,
                no_intra_emphasis: true,
                fenced_code_blocks: true }
    markdown_to_html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    sanitize(markdown_to_html.render(text))
  end

  def show_pagination
    is_homepage = request.path == '/'
    is_posts = (request.path == '/posts' && params[:action] == 'index')
    is_users_posts = request.path.match?(%r{^/users/\d+/posts$})

    is_homepage || is_posts || is_users_posts
  end
end
