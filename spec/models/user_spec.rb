require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:params) {
    { "email"=>"participate@gmail.com",
      "password"=>"",
      "password_confirmation"=>"" }
  }

  context "associations" do
  end

  context "#password_required?" do
    it "true, when provider is blank" do
      subject.should be_password_required
    end
  end
end