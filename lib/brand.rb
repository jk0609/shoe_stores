class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates :name, {
    presence: { message: "Your brand must have a name." },
    length: { maximum: 100, too_long: "Your brand name must be under #{count} characters." },
    uniqueness: {case_sensitive: false}
  }
  before_save(:format_name)

private
  def format_name
    split = self.name.split(" ")
    split.each do |word|
      word.capitalize!
    end
    self.name = split.join(" ")
  end

end
