class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase_info
end
