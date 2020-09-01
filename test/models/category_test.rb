require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "cateogry should be valid" do
    @category = Category.new(name: "Sports")
    assert @category.valid?
  end

end
