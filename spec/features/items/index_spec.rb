require "rails_helper"

RSpec.describe "Items Index" do
  describe "As a visitor" do 
    before :each do
      visit items_path
    end

    it "displays the names and attributes of each item" do

      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Item Expedita Aliquam")
      expect(page).to have_content("Item Provident At")

      expect(page).to have_content("Description:\nVoluptate aut labore qui illum tempore eius. Corrupti cum et rerum. Enim illum labore voluptatem dicta consequatur. Consequatur sunt consequuntur ut officiis.")
      expect(page).to have_content("Description:\nNumquam officiis reprehenderit eum ratione neque tenetur. Officia aut repudiandae eum at ipsum doloribus. Iure minus itaque similique. Ratione dicta alias asperiores minima ducimus nesciunt at.")
      expect(page).to have_content("Description:\nFuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet.")

      expect(page).to have_content("Price:\n$687.23")
      expect(page).to have_content("Price:\n$159.25")
      expect(page).to have_content("Price:\n$311.63")
    end

    it "displays each items name as a link that will take you to that items show page" do
      expect(page).to have_link("Item Nemo Facere")
      expect(page).to have_link("Item Expedita Aliquam")
      expect(page).to have_link("Item Provident At")

      click_link "Item Nemo Facere"

      expect(current_path).to eq(item_path(id: 4))
    end
  end
end