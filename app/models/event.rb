class Event < ActiveRecord::Base
  ALLOWED_MINUTES_FOR_RESPONSE = [30, 60, 90, 120, 150, 180]

  belongs_to :creator, class_name: User
  has_many :attendances
  has_many :friends, through: :attendances

  before_validation :fill_invite_from, unless: :invite_from
  before_validation :fill_invite_to, unless: :invite_to
  validates :name, :start_at, presence: true
  validate :timeline_is_correct, if: :start_at
  validate :attendance_limit, if: ->(event){event.attendees_min_count and attendees_max_count}
  validates :minutes_for_answer, inclusion: { in: ALLOWED_MINUTES_FOR_RESPONSE }

  private

  def fill_invite_from
    self.invite_from = DateTime.now
  end

  def fill_invite_to
    self.invite_to = start_at
  end

  def timeline_is_correct
    errors.add(:base, :invalid_dates_order) if invite_from >= invite_to or invite_to > start_at
  end

  def attendance_limit
    errors.add(:attendees_min_count, :cant_be_greater_then_attendees_min_count) if attendees_min_count > attendees_max_count
  end
end
