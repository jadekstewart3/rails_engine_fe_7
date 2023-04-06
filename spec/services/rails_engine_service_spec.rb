require "rails_helper"
RSpec.describe RailsEngineService do 
  describe "get_merchants" do 

    let(:merchants) { RailsEngineService.get_merchants }

    it "returns a json object" do
      expect(merchants).to be_a(Hash)

      expect(merchants).to have_key(:data)
      expect(merchants[:data]).to be_an(Array)
    end

    it "has the correct keys and values" do
      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_a(String)

        expect(merchant).to have_key(:type)
        expect(merchant[:type]).to be_a(String)

        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes]).to be_a(Hash)

        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end

  describe "get_one_merchant" do

    let(:merchant) { RailsEngineService.get_one_merchant(1) }
    
    it "returns a json object" do
      expect(merchant).to be_a(Hash)

      expect(merchant).to have_key(:data)
      expect(merchant[:data]).to be_an(Hash)

      expect(merchant[:data]).to have_key(:attributes)
      expect(merchant[:data][:attributes]).to be_a(Hash)

      expect(merchant[:data][:attributes]).to have_key(:name)
      expect(merchant[:data][:attributes][:name]).to be_a(String)
    end
  end

  describe "get_merchant_items" do 
    let(:merchant_items) { RailsEngineService.get_merchant_items(1) }

    it "returns a json object" do
      expect(merchant_items).to be_a(Hash)
      
      expect(merchant_items).to have_key(:data)
      expect(merchant_items[:data]).to be_an(Array)
    end

    it "has the correct keys and values" do
      merchant_items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to be_a(String)

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a(Hash)

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
        
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)
        
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)
        
        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_an(Integer)
      end
    end
  end
end