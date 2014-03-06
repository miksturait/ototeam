class Event < ActiveRecord::Base
  belongs_to :creator, class_name: User

  before_validation :fill_invite_from, unless: :invite_from
  before_validation :fill_invite_to, unless: :invite_to
  validates :name, :start_at, :minutes_for_answer, presence: true
  validate :timeline_is_correct, if: :start_at

  def attendees_count
    0
  end

  private

  def fill_invite_from
    self.invite_from = DateTime.now
  end

  def fill_invite_to
    self.invite_to = start_at
  end

  def timeline_is_correct
    errors.add(:base, 'Dates order is invalid') if invite_from >= invite_to or invite_to > start_at
  end
end
