require "rails_helper"

RSpec.describe "Merchants Index" do
  describe "As a visitor" do 
    it "it displays the names of each merchant" do
      visit merchants_path
    
      expect(page).to have_content("Schroeder-Jerde")
      expect(page).to have_content("Klein, Rempel and Jones")
    end

    it "each merchants name is a link to their show page" do 
      visit merchants_path
      
      click_link "Schroeder-Jerde"

      expect(current_path).to eq(merchant_path(id: 1))
    end
  end
end