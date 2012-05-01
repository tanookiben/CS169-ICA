require 'spec_helper'

describe PhoneNumber do
  it "should create successfully" do
    @num = PhoneNumber.create!({ :label => "Home", :info => "1234567890" })
    @num.head.should == "Home"
    @num.info.should == "1234567890"
  end
end
