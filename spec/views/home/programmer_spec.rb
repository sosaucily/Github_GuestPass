require 'spec_helper'

describe "home/programmer" do
  before(:each) do
    repo = double('repo')
    repo.stub(:name).and_return('Github_GuestPass')
    repo.stub(:id).and_return('4402294')
    repo.stub(:private).and_return(false)
    repos = [repo]
    assign(:all_repos,repos)
  end
  
  it "should show the public label next to a public repo" do
    render
    rendered.should have_selector('span.label-success')
  end
  
  it "should have a check box next to each project" do
    render
    rendered.should have_selector("input#project-select-4402294")
  end
end
