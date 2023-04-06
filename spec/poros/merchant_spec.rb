require "rails_helper"

RSpec.describe Merchant do 

  let(:bobs_burgers) { Merchant.new(id: 1, attributes: { name: "Bob's Burgers" }) }
  
  describe "#initialize" do 
    it "exits" do 
      expect(bobs_burgers).to be_a(Merchant)
    end

    it "has attributes" do
      expect(bobs_burgers.id).to eq(1)
      expect(bobs_burgers.name).to eq("Bob's Burgers")
    end
  end
end