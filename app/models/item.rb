class Item < ApplicationRecord
  has_one :brand
  has_many :images, dependent: :destroy
  belongs_to :user
  validates :name, length: { maximum: 20 }
  validates :description, length: { maximum: 20 }
  validates :price,numericality: { greater_than: 200, less_than: 10000000}
  enum delivery_days: { one_or_two_days: 0, two_or_three_days: 1, four_to_seven_days: 2 }
  enum condition: { unused: 0, almost_unused: 1, used: 2, a_little_dirty: 3, dirty: 4 }
end
