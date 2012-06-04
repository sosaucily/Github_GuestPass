require 'spec_helper'

describe Programmer do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should have an email" do
    programmer = FactoryGirl.create(:programmer)
    programmer.email.should =~ /.*@.*/
  end
end
