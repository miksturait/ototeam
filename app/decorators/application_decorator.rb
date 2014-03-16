class ApplicationDecorator < Draper::Decorator
  delegate_all
  delegate :content_tag, :to_s, :button_to, :t, to: :h
end
