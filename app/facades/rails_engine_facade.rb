class RailsEngineFacade
  attr_reader :service
  def initialize(params = {})
    @id = params[:id]
    @fragment = params[:search]
    @service = RailsEngineService.new
  end

  def get_all_merchants
    merchants = service.get_merchants
    merchants[:data].map do |merchant|
      Merchant.new(merchant)
    end
  end

  def get_one_merchant
    merchant = service.get_one_merchant(@id)
    Merchant.new(merchant[:data])
  end

  def get_items
    items = service.get_merchant_items(@id)
    items[:data].map do |item|
     Item.new(item)
    end
  end

  def get_all_merchant_items
    items = service.get_all_items
    items[:data].map do |item|
      Item.new(item)
    end
  end

  def get_one_item
    item = service.get_one_item(@id)
    Item.new(item[:data])
  end

  def find_one_merchant_by_fragment_search
    #  @fragment && !@fragment.empty?
      merchant = service.search_merchant_by_fragment(@fragment)
      # require 'pry'; binding.pry
      Merchant.new(merchant[:data]) unless merchant[:data].empty?

  end
end