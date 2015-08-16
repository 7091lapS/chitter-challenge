feature 'creating peeps' do

  scenario 'I can create a new peep' do
    user = create :user
    sign_in(user)
    visit '/peeps'
    fill_in 'new_peep', with: 'this is my test peep'
    click_on 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('this is my test peep')
    end

  end

  scenario 'I can only peep when logged in' do
    visit '/peeps/'
    expect(page).not_to have_field 'new_peep'
  end
  
 end
