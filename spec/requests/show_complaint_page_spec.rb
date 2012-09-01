# -*- encoding : utf-8 -*-
require 'spec_helper'
#require File.expand_path("../../../app/controllers/complaints_controller", __FILE__)

describe "Show Complaint Page" do

  subject { page }

  before do
    @complaint = FactoryGirl.create :complaint
    visit complaint_path(@complaint)
  end

  context "Complaint without attachments" do
    it { should have_content(@complaint.description) }
  end

  context "Complaint with attachments" do
    context "when attachment is a link" do
      before do
        @attachment = FactoryGirl.create :url_attachment, :url => 'www.google.com', :complaint => @complaint
        visit complaint_path(@complaint)
      end

      it { should have_content(@attachment.url) }

      context "when have more than one link" do
        before do
          @second_attachment = FactoryGirl.create :url_attachment, :url => 'www.bing.com', :complaint => @complaint
          visit complaint_path(@complaint)
        end

        it { should have_content(@attachment.url) }
        it { should have_content(@second_attachment.url) }

      end
    end

    it { should have_content(@complaint.description) }
    context "when attachment is a Google Map" do
      before do
        @attachment = FactoryGirl.create :gmaps_attachment, :complaint => @complaint
        visit complaint_path(@complaint)
      end

    end

  end

  #  describe 'creating a complaint' do
  #    it 'successfully' do
  #      count = Complaint.count
  #      fill_in 'user_email', :with => 'user@ofertus.com.br'
  #      click_on 'submit'
  #      (Complaint.count - 1).should == count
  #      should have_content('Denúncia cadastrada com sucesso.')
  #      should have_content('Minhas denúncias')
  #    end
  #  end
end
