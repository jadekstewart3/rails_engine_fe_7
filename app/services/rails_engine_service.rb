class RailsEngineService
  def connection
    url = "http://localhost:3000"
    Faraday.new(url: url)
  end

  def get_merchants
    response = connection.get("/api/v1/merchants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_one_merchant(merchant_id)
    response = connection.get("/api/v1/merchants/#{merchant_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_merchant_items(merchant_id)
    response = connection.get("/api/v1/merchants/#{merchant_id}/items")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_items
    response = connection.get("/api/v1/items")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_one_item(item_id)
    response = connection.get("/api/v1/items/#{item_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_merchant_by_fragment(fragment)
    response = connection.get("api/v1/merchants/find?name=#{fragment}")
    JSON.parse(response.body, symbolize_names: true)
  end
end