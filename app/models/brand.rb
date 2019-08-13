class Brand < ApplicationRecord
  has_many :items
  belongs_to :item, dependent: :destroy,foreign_key: "item_id"
end
