require 'test_helper'

class CategoriesControllerTest < ActionDispach::IntegrationTest
    def setup
        @category = Category.create(name: "sports")
    end
    
    
   test "should Get Categories Index" do
    get :index
    assert_response :success  
   end
   
   test "should Get new" do
    get new_category_path
    assert_response :success
   end
   
   test "should Get show" do
    get category_path
    assert_response :success
   end
    
end