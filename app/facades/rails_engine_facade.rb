class RailsEngineFacade

  def initialize(params)
    if params[:id].present?
      @id = params[:id]
    end
  end

  def get_all_merchants
    merchants = RailsEngineService.get_merchants
    merchants[:data].map do |merchant|
      Merchant.new(merchant)
    end
  end

  def get_one_merchant
    merchant = RailsEngineService.get_one_merchant(@id)
    Merchant.new(merchant[:data])
  end

  def get_items
    items = RailsEngineService.get_merchant_items(@id)
    items[:data].map do |item|
     Item.new(item)
    end
  end

  def get_all_merchant_items
    items = RailsEngineService.get_all_items
    items[:data].map do |item|
      Item.new(item)
    end
  end

  def get_one_item
    item = RailsEngineService.get_one_item(@id)
    Item.new(item[:data])
  end
end