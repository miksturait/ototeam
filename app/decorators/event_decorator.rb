class EventDecorator < ApplicationDecorator
  delegate :count, to: :attendances, prefix: true

  def limit_label
    "#{event.attendees_min_count || '*'} - #{event.attendees_max_count || '*'}"
  end

  def invited_friends_list
    attendances.map{ |attendance| attendance.friend }.to_sentence
  end

  def searched_name
    query = h.params[:q].try(:[], :name_or_description_cont)
    raw query ? name.gsub(query, content_tag(:strong, query, class: 'text-danger')) : name
  end
end
