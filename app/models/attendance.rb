class Attendance < ActiveRecord::Base
  belongs_to :friend
  belongs_to :event
  validates :event_id, :friend_id, presence: true
end
