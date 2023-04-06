require "rails_helper" 

RSpec.describe "Merchants Show" do
  describe "As a visitor" do
    before :each do 
      visit merchant_path(id: 1)
    end

    it "displays the Merchants name" do
      expect(page).to have_content("Schroeder-Jerde")
    end

    it "displays a list of the merchants items with thier attributes" do
      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Description:\nSunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Price:\n$42.91")
      expect(page).to have_content("Item Expedita Aliquam")
      expect(page).to have_content("Item Provident At")
    end
  end
end