require "spec_helper"
require "cancan/matchers"

describe "User" do
  describe "Abilities" do
    subject { ability }
    let(:ability){ Ability.new(user) }

    context "As a guest" do
      let(:user) { User.new }

      it { should be_able_to(:read, FactoryGirl.create(:user)) }
      it { should_not be_able_to(:edit, FactoryGirl.create(:user))}
      it { should_not be_able_to(:create, Complaint) }
      it { should_not be_able_to(:new, Complaint) }

    end

    context "As a user" do
      let(:user) { FactoryGirl.create(:user) }

      it { should be_able_to(:read, FactoryGirl.create(:user)) }
      it { should be_able_to(:edit, user)}

      it { should be_able_to(:create, Complaint)}
      it { should be_able_to(:create, Comment)}

    end
  end
end
