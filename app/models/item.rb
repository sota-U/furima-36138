class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_days

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :status_id
  validates :delivery_charge_id
  validates :shipping_area_id
  validates :shipping_days_id
  end
end
