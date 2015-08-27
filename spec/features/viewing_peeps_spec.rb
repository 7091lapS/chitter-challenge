feature 'Viewing peeps' do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'I can see existing peeps on the peeps page' do
    user.peeps.create(content: 'hello')
    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('JD03: hello')
    end
  end

  scenario 'I can view the timestamp' do
    user.peeps.create(content: 'test peep')
    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('JD03: test peep - date still to let')
    end
  end
end
