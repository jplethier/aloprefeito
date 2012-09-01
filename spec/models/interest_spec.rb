require 'spec_helper'

describe Interest do
  let(:interest) { FactoryGirl.create :interest }
  subject { interest }

  its(:save) { should be_true }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:complaint) }
  end

  describe 'accessibility' do
    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:complaint_id) }
    it { should allow_mass_assignment_of(:send_email) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:complaint_id) }
    it { should validate_presence_of(:complaint_id) }
    it { should validate_uniqueness_of(:complaint_id).scoped_to(:user_id) }
    it { should ensure_inclusion_of(:send_email).in_array([true, false]) }
  end
end
