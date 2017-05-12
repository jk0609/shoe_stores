class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates :name, {
    presence: { message: "Your brand must have a name." },
    length: { maximum: 100, too_long: "Your brand name must be under 100 characters." },
    uniqueness: {case_sensitive: false, message: 'That brand already exists.'}
  }
  validates :price, {
    presence: { message: "Your brand must have a price." },
  }
  before_save(:format_name, :price_format)


private
  def format_name
    split = self.name.split(" ")
    split.each do |word|
      word.capitalize!
    end
    self.name = split.join(" ")
  end

  def price_format
    self.price = ('%.02f' % self.price).to_s
  end
end
