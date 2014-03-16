class FriendDecorator < ApplicationDecorator
  def add_button(event)
    button_to h.event_attendances_path(event, params: { attendance: { friend_id: object.id } }), class: 'btn btn-primary btn-xs' do
      content_tag(:span, nil, class: "glyphicon glyphicon-plus")
    end
  end
end
