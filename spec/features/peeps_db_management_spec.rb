feature 'Users have their own peeps stored in database' do

   let!(:user) { FactoryGirl.create(:user, username:'owner', email: 'a@a.com') }

  scenario 'a users peep is stored' do

    peep_creation
    expect(User.first.peeps.map(&:content)).to eq(['posted this'])
  end

  scenario 'a users peeps timestamp is stored' do
    peep_creation
    expect(User.first.peeps.map(&:updated_at)).not_to be_empty
  end
end
