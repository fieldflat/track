class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :making_time, presence: true, length: { maximum: 100 }
  validates :serves, presence: true, length: { maximum: 100 }
  validates :ingredients, presence: true, length: { maximum: 300 }
  validates :cost, presence: true
end
