module ApplicationHelper
  def icon_link_to(icon, name, path, options = {})
    link_to path, options do
      content_tag(:span, nil, class: "glyphicon glyphicon-#{icon}") + " #{name}"
    end
  end

  def attribute_entry(object, field)
    content_tag(:dt, "#{object.class.human_attribute_name(field)}:") +
    content_tag(:dd, object.send(field))
  end
end
