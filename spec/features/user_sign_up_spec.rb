feature 'User sign up' do

  let(:user) { build(:user) }

  scenario 'with correct credentials' do
    sign_up(user)
    expect(page).to have_content("What's up, #{user.username}?")
  end

  scenario 'with existing username' do
    create(:user, email: "different@email.com")
    sign_up(user)
    expect(page).to have_content("Username is already taken")
  end

  scenario 'with existing email' do
    create(:user, username: "different_name")
    sign_up(user)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'with blank email' do
    user2 = build(:user, email: "")
    sign_up(user2)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with blank username' do
    user3 = build(:user, username: "")
    sign_up(user3)
    expect(page).to have_content 'Username must not be blank'
  end
end
