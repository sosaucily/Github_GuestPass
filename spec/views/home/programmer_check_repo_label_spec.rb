require 'spec_helper'

describe "home/programmer" do
  it "should show the public label next to a public repo" do
    repo = double('repo')
    repo.stub(:name).and_return('Github_GuestPass')
    repo.stub(:private).and_return(false)
    repos = [repo]
    assign(:all_repos,repos)
    render
    rendered.should have_selector('span.label-success')
  end
end
