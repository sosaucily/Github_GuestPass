require 'spec_helper'

describe "User" do
  
  describe "can see homepage" do
    it "shows the homepage when a user visits the root url" do
      visit '/'
      page.should have_selector('section#home-programmers')
    end
  end
end
