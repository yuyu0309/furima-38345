class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)

    PurchaseInfo.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
      building_name: building_name, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end
end