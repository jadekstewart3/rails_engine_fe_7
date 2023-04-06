require "rails_helper"

RSpec.describe RailsEngineFacade do 

  
  describe "#merchant_list" do
    it "returns a list of merchant names" do
      merchants_list = RailsEngineFacade.new(empty: '') 
    
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

end