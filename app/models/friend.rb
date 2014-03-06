class Friend < ActiveRecord::Base
  belongs_to :creator, class_name: User
 # has_and_belongs_to_many :groups, foreign_key: friend_id
  validates :name, presence: true
  validates :email, presence: true
  validates :numer_tel,  numericality: { greater_than: 1,
                                         only_integer: true }, presence: true
end
