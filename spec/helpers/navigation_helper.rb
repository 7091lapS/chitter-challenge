module NavigationHelpers
  def peep_creation
    sign_in(user)
    visit '/peeps'
    fill_in 'new_peep', with: 'posted this'
    click_on 'Peep'
  end
end
