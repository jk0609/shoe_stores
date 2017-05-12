class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes
  has_many :labels
  has_many :tags, through: :labels
end
