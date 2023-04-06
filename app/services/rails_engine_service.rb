class RailsEngineService
  def self.connection
    url = "http://localhost:3000"
    Faraday.new(url: url)
  end

  def self.get_merchants
    response = connection.get("/api/v1/merchants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_one_merchant(merchant_id)
    response = connection.get("/api/v1/merchants/#{merchant_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchant_items(merchant_id)
    response = connection.get("/api/v1/merchants/#{merchant_id}/items")
    JSON.parse(response.body, symbolize_names: true)
  end
end