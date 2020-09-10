class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :category, :condition, :shipping_fee, :prefecture, :shipping_date, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 0 } 

  validates  :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
end
