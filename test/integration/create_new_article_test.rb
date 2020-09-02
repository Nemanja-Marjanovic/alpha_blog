require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end


  test "create new article" do
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: "some title", description: "some description"}}
      follow_redirect!
    end

    assert_template 'articles/show'
  end

end
