require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "As a visitor" do
    before :each do 
      visit root_path
    end

    it "it displays a form to search for merchants" do
      expect(page).to have_field(:search)
      expect(page).to have_button("Search")
    end

    it "returns a merchant based of off the search" do 
      fill_in :search, with: "iLl"
      click_button "Search"

      expect(page).to have_content("Willms and Sons")
    end

    it "the merchant it returns is a link to the merchants show page" do
      fill_in :search, with: "iLl"
      click_button "Search"

      expect(page).to have_link("Willms and Sons")

      click_link "Willms and Sons"

      expect(current_path).to eq(merchant_path(id: 3))
    end

    it "displays that no results are found if no merchant is returned" do
      fill_in :search, with: "asidskanvdv"
      click_button "Search"

      expect(page).to have_content("No Merchant Found")
    end
  end
end