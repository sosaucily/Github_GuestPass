require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "Authenticated programmer goes to the /programmer page", :git_api=>true do
    it "Builds list of projects" do
      programmer = FactoryGirl.create(:programmer)
      session[:gh_login] = programmer.email
      session[:gh_password] = 'ghgpservice1'
      get 'programmer'
      all_project_names = assigns(:all_repos).map {|repo| repo["name"]}
      all_project_names.should include('Github_GuestPass')
    end
  end
end
