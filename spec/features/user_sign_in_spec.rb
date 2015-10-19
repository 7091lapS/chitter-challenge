feature 'user sign in' do

  scenario 'correctly signs in' do
    user = create :user, email: 'ex2@example2.com', username: 'ex'
    sign_in(user)
    expect(page).to have_content "What's up, #{user.username}?"
  end

  context 'incorrect credentials' do

    scenario 'with incorrect password' do
      user = create(:user)
      wrong_user = build(:user, password: "wrong_password")
      sign_in(wrong_user)
      expect(page).to have_content('The username or password is incorrect')
    end

    scenario 'with incorrect email' do
      user = create(:user)
      wrong_user = build(:user, email: "wrong@email")
      sign_in(wrong_user)
      expect(page).to have_content('The username or password is incorrect')
    end

  end

end
