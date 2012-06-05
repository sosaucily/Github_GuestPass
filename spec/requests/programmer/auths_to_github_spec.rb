require 'spec_helper'

describe "Programmer" do
  
  before(:each) do
  end
  
  it "fails to authenticate to Github, they should see an error", :git_api=>true do
    programmer = FactoryGirl.create(:programmer)
    visit '/'
    fill_in "email", with: "bad_email@fake.com"
    fill_in "password", with: "bad_pass"
    click_button "Authenticate"
    
    page.should have_selector('.alert-error')
  end
  
  it "authenticates to Github and gets redirected to the programmer page", :git_api=>true do
    #pending "Don't authenticate everytime, overuse of github api"
    
    programmer = FactoryGirl.create(:programmer)
    visit '/'
    fill_in "email", with: programmer.email
    fill_in "password", with: "ghgpservice1"

    #I don't want to actually auth the GP right now, because of overuse of API calls.
    #This should be in a tagged section that doesn't get run all the time.
    click_button "Authenticate"
    
    page.should have_selector('section#authed-programmers')
  end
  
  
end
