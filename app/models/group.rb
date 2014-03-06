class Group < ActiveRecord::Base
  belongs_to :creator, class_name: User
  has_many :group_memberships
  has_many :friends, through: :group_memberships

  validates :name, presence: true

  delegate :count, to: :friends, prefix: true
end
