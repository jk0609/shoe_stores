class Store < ActiveRecord::Base
  has_many :shoes
  has_many :brands, through: :shoes

  validates :name, {
    presence: { message: "Your store must have a name." },
    length: { maximum: 100, too_long: "Your store name must be under #{count} characters." },
    uniqueness: {case_sensitive: false, message: 'That brand already exists.'}
  }
  before_save(:format_name)

  def unassigned
    available = []
    Brand.all.each do |brand|
      if self.brands.ids.include?(brand.id)==false
        available.push(brand)
      end
    end
    available
  end

private
  def format_name
    split = self.name.split(" ")
    split.each do |word|
      word.capitalize!
    end
    self.name = split.join(" ")
  end
end
