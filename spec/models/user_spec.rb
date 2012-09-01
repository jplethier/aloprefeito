require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build :user }
  subject { user }

  its(:save) { should be_true }

  describe 'acessibility' do
    it { should allow_mass_assignment_of(:uid) }
    it { should allow_mass_assignment_of(:provider) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:created_at) }
    it { should allow_mass_assignment_of(:updated_at) }
    it { should allow_mass_assignment_of(:last_name) }
    it { should allow_mass_assignment_of(:email) }
  end

  describe 'validations' do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:provider) }
  end
end
