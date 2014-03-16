class AttendanceDecorator < ApplicationDecorator
  delegate :fullname, to: :friend

  def label
    "(unconfirmed) #{fullname}"
  end

  def cancel_button
    button_to h.event_attendance_path(object.event, object), method: :delete, class: 'btn btn-danger btn-xs' do
      content_tag(:span, nil, class: "glyphicon glyphicon-minus")
    end
  end
end
