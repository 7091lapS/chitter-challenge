feature 'User sign up' do
  scenario 'with correct credentials' do
    user = build(:user, email: 'example@example.com', username: 'other')
    sign_up(user)
    expect(page).to have_content("What's up, #{user.username}?")
  end
end
