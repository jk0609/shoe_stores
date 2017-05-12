class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates :name, {
    presence: { message: "Your brand must have a name." },
    length: { maximum: 100, too_long: "Your brand name must be under #{count} characters." }
  }

end
