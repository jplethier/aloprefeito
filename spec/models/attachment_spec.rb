require 'spec_helper'

describe Attachment do
  let(:attachment) { FactoryGirl.create :attachment }
  subject { attachment }

  its(:save) { should be_true }

  describe 'associations' do
    it { should belong_to(:complaint) }
  end

  describe 'accessibility' do
    it { should allow_mass_assignment_of(:complaint_id) }
    it { should allow_mass_assignment_of(:latitude) }
    it { should allow_mass_assignment_of(:longitude) }
    it { should allow_mass_assignment_of(:attachment_file_name) }
    it { should allow_mass_assignment_of(:attachment_content_type) }
    it { should allow_mass_assignment_of(:attachment_file_size) }
    it { should allow_mass_assignment_of(:attachment_updated_at) }
    it { should allow_mass_assignment_of(:gmaps) }
  end

  describe 'validations' do
  end
end
