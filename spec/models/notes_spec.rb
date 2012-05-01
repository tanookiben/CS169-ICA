require 'spec_helper'

describe Note do
  it "should create successfully" do
    @note = Note.create!({ :subject => "some topic", :body => "some content" })
    @note.head.should == "some topic"
  end
end
