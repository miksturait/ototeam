class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def friends_count
    0
  end
end
