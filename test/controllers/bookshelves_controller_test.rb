require 'test_helper'

class BookshelvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookshelf = bookshelves(:one)
  end

  test "should get index" do
    get bookshelves_url, as: :json
    assert_response :success
  end

  test "should create bookshelf" do
    assert_difference('Bookshelf.count') do
      post bookshelves_url, params: { bookshelf: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show bookshelf" do
    get bookshelf_url(@bookshelf), as: :json
    assert_response :success
  end

  test "should update bookshelf" do
    patch bookshelf_url(@bookshelf), params: { bookshelf: {  } }, as: :json
    assert_response 200
  end

  test "should destroy bookshelf" do
    assert_difference('Bookshelf.count', -1) do
      delete bookshelf_url(@bookshelf), as: :json
    end

    assert_response 204
  end
end
