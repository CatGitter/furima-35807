class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, format: {with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number, format: {with:/\A(0{1}\d{9,10})\z/}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
