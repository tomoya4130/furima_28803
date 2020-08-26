class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
  end
  validates :category_id, numericality: { other_than: 0, message: "Select"}
  validates :status_id, numericality: { other_than: 0, message: "Select"}
  validates :shipping_fee_burden_id, numericality: { other_than: 0, message: "Select"}
  validates :shipping_region_id, numericality: { other_than: 0, message: "Select"}
  validates :days_until_shipping_id, numericality: { other_than: 0, message: "Select"}
  #金額範囲に関するバリデーション
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
