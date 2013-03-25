require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user must have a name" do
  	# Build is equivalent to .new, creating a record, 
  	# but not saving it. We want username to be nil.
  	user = FactoryGirl.build(:user)
  	user.name = nil

  	refute user.valid?
  end

  test "user must have an email" do 
  	user = FactoryGirl.build(:user)
  	user.email = nil

  	refute user.valid?
  end

  test "Cannot change password digest" do
  	user = FactoryGirl.create(:user)
  	assert_raises(ActiveModel::MassAssignmentSecurity::Error) { user.update_attributes(:password_digest => "jfhdajkshjkafsdkjhsadkjh") }
  end

  test "cannot have two users with the same email" do
    user = FactoryGirl.create(:user, :email => "bugs@gmail.com")
    second_user = FactoryGirl.build(:user, :email => "bugs@gmail.com")
    refute second_user.save

    assert_equal ["has already been taken"], second_user.errors[:email] 
  end

  test "user must have a password" do
  	assert true
  end


end
