class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :groups, foreign_key: :creator_id, dependent: :destroy
  has_many :friends, ->(obj){ where('friends.user_id is NULL or friends.user_id != ?', obj.id) },
           foreign_key: :creator_id, dependent: :destroy
  has_many :profiles, foreign_key: :user_id, class_name: Friend, dependent: :nullify
  has_one :own_profile, ->(obj){ where(creator_id: obj.id) }, foreign_key: :user_id, class_name: Friend, dependent: :destroy
  accepts_nested_attributes_for :own_profile

  after_create :create_own_profile
end
