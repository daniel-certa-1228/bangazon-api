class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customers_id, :pay_methods_id

  has_many :products

  private
  def order_details
      OrderDetailsSerializer.new(object.order_details).attributes
  end
end
