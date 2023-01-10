module ApplicationHelper
  def active_link_to(link_text, link_path, link_class)
    active = current_page?(link_path) ? 'active' : ''
    link_to link_text, link_path, class: "#{link_class} #{active}"
  end
end
