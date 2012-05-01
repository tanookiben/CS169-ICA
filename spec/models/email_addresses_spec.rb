require 'spec_helper'

describe EmailAddress do
  it "should create successfully" do
    @email = EmailAddress.create({ :label => "Home", :info => "some@address.com" })
    @email.head.should == "Home"
    @email.info.should == "some@address.com"
  end
end
