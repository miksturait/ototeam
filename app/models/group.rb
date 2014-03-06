class Group < ActiveRecord::Base
  belongs_to :creator, class_name: User

  validates :name, presence: true

  def friends_count
    0
  end
end
