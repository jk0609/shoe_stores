require('spec_helper')

describe('add and update a new project', {:type => :feature}) do
  it('allows a user to create, read and update attributes of a Store object ') do
    visit('/')
    fill_in('s_name', :with =>'Test Store')
    click_button('Add Store')
    click_on('Test Store')
    fill_in('s_name', :with =>'Test Store 2')
    click_button('Update Name')
    expect(page).to have_content('Test Store 2')
  end
end
