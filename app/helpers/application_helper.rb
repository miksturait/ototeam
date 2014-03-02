module ApplicationHelper
  def icon_link_to(icon, name, path, options = {})
    link_to path, options do
      content_tag(:span, nil, class: "glyphicon glyphicon-#{icon}") + " #{name}"
    end
  end
end
