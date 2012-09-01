require 'spec_helper'

describe Complaint do
  let(:complaint) { FactoryGirl.build :complaint }
  subject { complaint }

  its(:save) { should be_true }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'acessibility' do
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:anonymous) }
    it { should allow_mass_assignment_of(:resolved) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should ensure_inclusion_of(:anonymous).in_array([false, true]) }
    it { should ensure_inclusion_of(:resolved).in_array([false, true]) }
  end
end
