class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token, :item_id, :user_id

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/ }
    validates :token
  end

  # ActiveHashの選択が「ーーー」のときは保存できないようにする
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # 購入の情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 配送先住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
