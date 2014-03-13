class EventDecorator < Draper::Decorator
  delegate_all

  def limit_label
    "#{event.attendees_min_count || '*'} - #{event.attendees_max_count || '*'}"
  end
end
