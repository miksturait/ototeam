class EventDecorator < ApplicationDecorator
  delegate :count, to: :attendances, prefix: true

  def limit_label
    "#{event.attendees_min_count || '*'} - #{event.attendees_max_count || '*'}"
  end
end
