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

  # def merchant_and_items
  #   merchant = {
  #                 merchant: get_one_merchant,
  #                 merch_items: get_items
  #               }
  # end
end