RSpec.shared_context 'When authenticated' do
  background do
    authenticate
  end

  def authenticate
    visit '/sessions/new'
    within('form#new_user') do
      fill_in "user_email", :with => "test@example.com"
      fill_in "user_password", :with => "test1234"
    end
    click_button 'Login_user'
  end
end
