require 'test_helper'

class CreateCategoriesTest < ActionDispach::IntegrationTest
    
    def setup
        @category =  Category.create(name: "Dinosaurs")
        @category2 = Category.create(name: "Minecraft")
    end
    
    test "Should Show Categories Listing" do
        get categries_path
        assert_template 'categories/index'
        assert_select 'a[href=?]', category_path(@category), text: @category.name
        assert_select 'a[href=?]', category_path(@category2), text: @category2.name
    end
end

