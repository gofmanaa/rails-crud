require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should not save user without attributes' do
    user = User.new
    assert_not user.save
  end

  test 'should not save user without password_confirmation' do
    @user.password_confirmation = ''
    user = @user
    assert_not user.save
  end

  test 'should by save user' do
    user = @user
    assert user.save
  end

  test 'should by present psw' do
    user = @user
    user.save
    assert user.psw.present?
  end
end
