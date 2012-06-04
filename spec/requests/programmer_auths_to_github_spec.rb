require 'spec_helper'

describe "ProgrammerAuthsToGithub" do
  
  before(:each) do
    unless defined?(::Rails)
      @mocked_rails_class = true
      class ::Rails
      end
    end
  end
  
  it "authenticates programmer to Github" do
    
    #Stub
    ::Rails.should_receive(:root).at_least(:once).and_return('/')
    
    programmer = FactoryGirl.create(:programmer)
    visit ::Rails.root
    fill_in "email", with: programmer.email
    click_button "Authenticate"
  end
end
