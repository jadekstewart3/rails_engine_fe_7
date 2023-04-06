require "rails_helper"

RSpec.describe RailsEngineFacade do 

  
  describe "#merchant_list" do
    it "returns a list of merchant names" do
      merchants_list = RailsEngineFacade.new({}) 
    
      merchants = merchants_list.get_all_merchants
      merchants.take(5).each do |merchant|
        expect(merchant).to be_a(Merchant)
        expect(merchant.name).to be_a(String)
      end
    end
  end

  describe "#get_one_merchant" do
    it "returns one merchant" do
      merchant_info = RailsEngineFacade.new(id: 1)
      merchant = merchant_info.get_one_merchant

      expect(merchant).to be_a(Merchant)
      expect(merchant.name).to be_a(String)
    end
  end

  describe "get_items" do
    it "returns a list of a specific merchants items" do
      items_info = RailsEngineFacade.new(id: 1)
      items = items_info.get_items
      
      items.each do |item|
        expect(item).to be_a(Item)

        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_an(Integer)
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
      end
    end
  end

  describe "get_all_items" do
    it "returns a list of all merchants items" do 
      items_json = RailsEngineFacade.new({})
      items = items_json.get_all_merchant_items

      items.each do |item|
        expect(item).to be_a(Item)

        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_an(Integer)
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
      end
    end
  end

  describe "get_one_item" do
    it "returns one item" do
      item_json = RailsEngineFacade.new(id: 4)
      item = item_json.get_one_item
    
      expect(item.id).to be_a(String)
      expect(item.merchant_id).to be_an(Integer)
      expect(item.name).to be_a(String)
      expect(item.description).to be_a(String)
      expect(item.unit_price).to be_a(Float)
    end
  end

  describe "find_one_merchant_by_fragment_search" do
    it "returns one merchant that is like the search fragment" do
      merchant_json = RailsEngineFacade.new(search: "iLl")
      merchant = merchant_json.find_one_merchant_by_fragment_search
      
      expect(merchant).to be_a(Merchant)
      expect(merchant.id).to be_a(String)
      expect(merchant.name).to be_a(String)
    end
  end
end