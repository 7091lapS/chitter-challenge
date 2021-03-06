feature 'creating peeps' do

  scenario 'I can only peep when logged in' do
    visit '/peeps'
    expect(page).not_to have_field 'new_peep'
  end

  scenario 'Peeps belong to users' do
    user = (create :user, username: 'owner', email: 'a@a.com')
    sign_in(user)
    visit '/peeps'
    fill_in 'new_peep', with: 'posted this'
    click_on 'Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('owner: posted this')
    end
  end
 end
