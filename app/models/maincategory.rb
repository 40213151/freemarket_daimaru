class Maincategory < ApplicationRecord
  has_ancestry
  has_many :items
end
