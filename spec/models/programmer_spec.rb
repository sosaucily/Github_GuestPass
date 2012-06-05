require 'spec_helper'

describe Programmer do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should have an email" do
    programmer = FactoryGirl.create(:programmer)
    programmer.email.should =~ /.*@.*/
  end
  
  it "authenticates to Github and returns a authenticated Octokit::Client object", :git_api=>true do
    session = {"gh_login"=>'ghgpservice',"gh_password"=>'ghgpservice1'}
    client = Programmer.auth_user_from_session(session)
    client.authenticated?.should be_true
  end
end
