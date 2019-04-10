require "test_helper"

class CategoryTest < ActiveSupport::TestCase
   
   def setup
      @category = Category.new(name: "History")
   end

    test "category should be Valid" do
        assert @category.valid?
    end
    
    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end
    
    test "name should be Unique" do
        @category.save
        category2 = Category.new(name: "History")
        assert_not category2.valid?
    end
    
    test "Name Should Not Be Too Long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end
    
    test "name should not be Too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end