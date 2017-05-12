class Store < ActiveRecord::Base
  has_many :shoes
  has_many :brands, through: :shoes

  validates :name, {
    presence: { message: "Your store must have a name."},
    length: { maximum: 100, too_long: "Your store name must be under #{count} characters." }
  }
    #uniqueness
end
