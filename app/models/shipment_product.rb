class ShipmentProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shipment

  validates_presence_of :product_id, :shipment_id, :quantity, :created_at, :updated_at
end
