class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates :name, presence: { message: "Your brand must have a name." }
  #uniqueness
  #price must be  float
  #<100 chars
end
