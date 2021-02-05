require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  
  #failing test
  test "should not save link without proper url" do
    link = Link.new
    assert_not link.save
  end
end
