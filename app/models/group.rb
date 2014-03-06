class Group < ActiveRecord::Base
  belongs_to :creator, class_name: User
 # has_and_belongs_to_many :friend, foreign_key  :
  validates :name, presence:true


end
