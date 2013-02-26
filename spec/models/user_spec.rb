require 'spec_helper'

describe User do
  describe "validatrtions" do
    before :each do
      @user = User.new(:email => "captianovious@obv.se", :password => "secure!")
    end

    it "should be a valid user" do
      @user.should be_valid
    end
    it "should be invalid with out an email" do
      @user.email = nil
      @user.should_not be_valid 
    end

    it "should be invalid with out a password" do
      @user.password = nil
      @user.should_not be_valid 

    end
    it "Stores the corrent values" do
      @user.email.should eql("captianovious@obv.se")
      
      @user.password.should eql("secure!")
    end
  end
end
