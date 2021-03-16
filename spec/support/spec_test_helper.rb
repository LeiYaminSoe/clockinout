module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id])
  end
end

# spec/spec_helper.rb
RSpec.configure do |config|
  config.include SpecTestHelper, :type => :controller
end
