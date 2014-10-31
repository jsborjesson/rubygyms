require 'rails_helper'

RSpec.describe User, :type => :model do
  it { is_expected.not_to accept_values_for :email, "" }
  it { is_expected.to accept_values_for :email, "email@email.com" }

  it "has a full name" do
    user = Factory(:user, first_name: "John", last_name: "Doe")
    expect(user.full_name).to eq "John Doe"
  end

  it "reports the correct role when owner" do
    user = Factory(:owner)
    expect(user).not_to be_member
    expect(user).to be_owner
  end

  it "reports the correct role when member" do
    user = Factory(:member)
    expect(user).to be_member
    expect(user).not_to be_owner
  end


end