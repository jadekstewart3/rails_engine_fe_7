class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @description = info[:attributes][:description]
    @unit_price = info[:attributes][:unit_price]
    @merchant_id = info[:attributes][:merchant_id]
  end
end