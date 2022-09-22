class PurchaseInfo < ApplicationRecord
  belongs_to :purchase_management
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
