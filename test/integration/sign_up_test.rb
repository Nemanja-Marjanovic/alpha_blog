require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest

  test "create new user on sign up" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {username: "neko nesto", email: "nekiemail@nesto.com", password: "sifra123"}}
      follow_redirect!
    end
    assert_template 'users/show'
  end
end
