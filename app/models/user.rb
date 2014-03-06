class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events,
           foreign_key: :creator_id
  has_many :friends,
            foreign_key: :creator_id
  has_many :groups,
           foreign_key: :creator_id
end
