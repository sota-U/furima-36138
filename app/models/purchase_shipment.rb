class PurchaseShipment

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :municipality
    validates :address
    validates :phone_number, numericality: { with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/ }, length: { minimum: 10, maximum: 11}
    #validates :purchase_id
    validates :user_id
    validates :item_id
  end

  def save

    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Shipment.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end