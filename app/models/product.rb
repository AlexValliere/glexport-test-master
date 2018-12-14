class Product < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
  has_many :shipments, :through => :shipment_products

  validates_presence_of :sku, :description, :company_id, :created_at, :updated_at
end
