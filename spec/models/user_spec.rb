describe User do

  let(:user) { create(:user) }

  it 'stores user' do
    create(:user)
    expect(User.map(&:name)).to include('John Doe')
    expect(User.first.email).to eq('john@doe.com')
    expect(User.first.username).to eq('JD03')
  end

  it 'authenticates at login with correct credentials' do
    authenticated = User.authenticate(user.email, user.password)
    expect(authenticated).to eq user
  end

  it 'does not authenticate with incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

  it 'requires an email' do
    user = attributes_for(:user, email: "")
    User.create(user)
    expect(User.count).to eq(0)
  end

  it 'requires a username' do
    user = attributes_for(:user, username: "")
    User.create(user)
    expect(User.count).to eq(0)
  end

  it 'only allows unique usernames' do
    user1 = attributes_for(:user)
    user2 = attributes_for(:user)
    User.create(user1)
    User.create(user2)
    expect(User.count).to eq(1)
  end

  it 'only allows unique emails' do
    user1 = attributes_for(:user)
    user2 = attributes_for(:user)
    User.create(user1)
    User.create(user2)
    expect(User.count).to eq(1)
  end
end
