module ApplicationHelper
  def render_readme
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
                       .render(File.open(Rails.root + "README.md", 'r').read)
                       .html_safe
  end
end
