require('spec_helper')

describe('add and update a new store', {:type => :feature}) do
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
describe('delete an existing store', {:type => :feature}) do
  it('allows a user to delete an existing Store object ') do
    store = Store.create({:name=>'Test Store 2'})
    visit('/stores/'+store.id.to_s)
    click_button('Delete This Store')
    expect(page).to have_no_content('Test Store 2')
  end
end
describe('add brands to a store', {:type => :feature}) do
  it('allows a user to add brands to a store object ') do
    store = Store.create({:name=>'Test Store 2'})
    brand = Brand.create({:name=>'Test Brand', :price=>'20.00'})
    visit('/stores/'+store.id.to_s)
    page.check(brand.name)
    click_button('Add Brand')
    expect(page).to have_content(brand.name)
  end
end

describe('add and update a new brand', {:type => :feature}) do
  it('allows a user to create and read a Brand object ') do
    visit('/brands')
    fill_in('b_name', :with =>'Test Brand')
    fill_in('b_price', :with =>'20')
    click_button('Add Brand')
    expect(page).to have_content('Test Brand - $20.00')
  end
end
