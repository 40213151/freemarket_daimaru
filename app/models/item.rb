class Item < ApplicationRecord
  has_one :brand
  has_many :images
  belongs_to :user
  validates :name, length: { maximum: 20 }
  validates :description, length: { maximum: 20 }
  validates :price,numericality: { greater_than: 200, less_than: 10000000}
end
