class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  #ActiveHashのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  #ActiveHashの選択が「ーーー」のときは保存できないようにする
  validates :category_id, numericality: { other_than: 0, message: "Select"}
  validates :status_id, numericality: { other_than: 0, message: "Select"}
  validates :shipping_fee_burden_id, numericality: { other_than: 0, message: "Select"}
  validates :shipping_region_id, numericality: { other_than: 0, message: "Select"}
  validates :days_until_shipping_id, numericality: { other_than: 0, message: "Select"}
end
