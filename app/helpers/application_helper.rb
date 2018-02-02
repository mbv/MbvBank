# frozen_string_literal: true

module ApplicationHelper
  def nav_link(title, url)
    css_class = 'nav-link'
    css_class += ' active' if params[:controller] == Rails.application.routes.recognize_path(url)[:controller]
    link_to(title, url, class: css_class)
  end
end
