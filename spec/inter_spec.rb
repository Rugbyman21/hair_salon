require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new client', {:type => :feature}) do
  it('allows a user to click a client to see the stylist for them') do
    visit('/')
    click_link('Add New Client')
    fill_in('name', :with =>'Bob')
    click_button('Add client')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the clients', {:type => :feature}) do
  it('allows a user to see all of the client they have') do
    client = Client.new({:name => "Bob", :id => nil})
    client.save()
    visit('/')
    click_link('View All Client')
    expect(page).to have_content(client.name)
  end
end

describe('seeing details for a single client', {:type => :feature}) do
  it('allows a user to click a client to see the stylist for them') do
    test_client = Client.new({:name => "Bob", :id => nil})
    test_client.save()
    test_stylist = Stylist.new({:name => "Terry", :client_id => test_client.id()})
    test_stylist.save()
    visit('/clients')
    click_link(test_client.name())
    expect(page).to have_content(test_stylist.name())
  end
end

describe('adding stylist to a client', {:type => :feature}) do
  it('allows a user to add a stylist to a client') do
    test_client = Client.new({:name => "Bob", :id => nil})
    test_client.save()
    visit("/clients/#{test_client.id()}")
    fill_in("name", {:with => "Terry"})
    click_button("Add Stylist")
    expect(page).to have_content("Success")
  end
end
