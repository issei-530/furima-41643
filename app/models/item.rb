class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :user

  validates :image, :product_name, :product_description, :category_id, :product_condition_id, :shipping_fee_id, :region_id, :shipping_day_id, :price, presence: true
  
  validates :category_id, :product_condition_id, :shipping_fee_id, :region_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
end
