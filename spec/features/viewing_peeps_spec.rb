feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do

    Peep.create(user: '7091laps', content: 'my first peep')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('7091laps my first peep')
    end
  end
end