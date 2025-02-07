class BuyDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :city, :street_address, :building_name, :telephone, :buy_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ise invalid. Include hyphen(-)"}
    validates :region_id
    validates :city
    validates :street_address
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください"} 
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building_name: building_name, telephone: telephone, buy_id: buy.id)
  end
end