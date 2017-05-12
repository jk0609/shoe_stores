class Store < ActiveRecord::Base
  has_many :shoes
  has_many :brands, through: :shoes

  validates :name, {
    presence: { message: "Your store must have a name." },
    length: { maximum: 100, too_long: "Your store name must be under 100 characters." },
    uniqueness: {case_sensitive: false, message: 'That store already exists.'},
    format: { without: /\b(curmudgeon|lout|clodhopper)\b/i }
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

  def add_many_brands(id_arr)
    if id_arr!=nil
      id_arr.each do |id|
        self.brands.push(Brand.find(id.to_i))
      end
    end
  end

  def remove_many_brands(id_arr)
    if id_arr!=nil
      id_arr.each do |id|
        self.brands.destroy(Brand.find(id.to_i))
      end
    end
  end

private
  def format_name
    split = self.name.split(" ")
    dont_cap = ['a', 'an', 'the', 'and', 'but', 'or', 'for', 'on', 'at', 'to', 'from', 'by']
    split.each_with_index do |word,i|
      word.downcase!
      if dont_cap.include?(word)==false||i==0
        word.capitalize!
      end
    end
    self.name = split.join(" ")
  end

end
