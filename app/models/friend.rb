class Friend < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :numer_tel,  numericality: { greater_than: 1,
                                         only_integer: true }, presence: true
end
