require "rails_helper"

RSpec.describe "Item Show" do
  before :each do 
    visit item_path(id: 4)
  end
  describe "As a visitor" do 
    it "displays an items name and attributes" do
      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Description:\nSunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Price:\n$42.91")
    end
  end
end