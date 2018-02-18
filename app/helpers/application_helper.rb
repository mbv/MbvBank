# frozen_string_literal: true

module ApplicationHelper
  def nav_link(title, url)
    css_class = 'nav-link'
    css_class += ' active' if params[:controller] == Rails.application.routes.recognize_path(url)[:controller]
    link_to(title, url, class: css_class)
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        'alert-success'   # Green
      when 'error'
        'alert-danger'    # Red
      when 'alert'
        'alert-warning'   # Yellow
      when 'notice'
        'alert-info'      # Blue
      else
        flash_type.to_s
    end
  end
end
