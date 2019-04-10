require 'test_helper'

class CreateCategoriesTest < ActionDispach::IntegrationTest
   
   test "Get New Category from and Create category" do
       get new_category_path
       assert_template 'categries/new'
       assert_difference 'Category.count', 1 do
           post_via_redirect categries_path, category: {name: "sports"}
        end
        assert_template 'categries/index'
        assert_match "sports", response.body
   end 

    test "invaild category submission results in failure" do
       get new_category_path
       assert_template 'categries/new'
       assert_no_difference 'Category.count' do
           post_via_redirect categries_path, category: {name: " "}
        end
        assert_template 'categries/index'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end
end