require 'spec_helper'

describe Complaint do
  let(:complaint) { FactoryGirl.build :complaint }
  subject { complaint }

  its(:save) { should be_true }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:interests) }
    it { should have_many(:attachments) }
    it { should have_many(:maps) }
    it { should have_many(:pictures) }
    it { should have_many(:fonts) }
    it { should have_many(:embeds) }
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

  describe 'relationships' do
    describe "maps" do
      it "should not accept more than one map" do
        2.times do
          complaint.maps << FactoryGirl.build(:gmaps_attachment)
        end
        complaint.should_not have(0).errors_on :maps
      end
      it "should accept a single map" do
        complaint.maps << FactoryGirl.build(:gmaps_attachment)
        complaint.should have(0).errors_on :maps
      end
    end
    describe "embed" do
      it "should not accept more than one embed" do
        2.times do
          complaint.maps << FactoryGirl.build(:embed_attachment)
        end
        complaint.should_not have(0).errors_on :maps
      end
      it "should accept a single map" do
        complaint.maps << FactoryGirl.build(:embed_attachment)
        complaint.should have(0).errors_on :maps
      end
    end
  end

  describe 'callbacks' do
    describe "Before saving a Complaint" do
      it "should automatically create an Interest for the user" do
        user = FactoryGirl.create(:user)
        complaint = FactoryGirl.build(:complaint, :user => user)
        Interest.where(:user_id => user.id).should be_empty
        complaint.save
        Interest.where(:user_id => user.id, :complaint_id => complaint.id).should_not be_empty
      end
      context "when complaint is anonymous" do
        it "should set user_id to nil" do
          complaint = FactoryGirl.build(:complaint_with_user, :anonymous => true)
          complaint.save
          complaint.reload.user_id.should be_nil
        end
        it "should not set user_id to nil" do
          complaint = FactoryGirl.build(:complaint_with_user, :anonymous => false)
          complaint.save
          complaint.user_id.should_not be_nil
        end
      end
    end
  end
end
