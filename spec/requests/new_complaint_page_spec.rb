# -*- encoding : utf-8 -*-
require 'spec_helper'
#require File.expand_path("../../../app/controllers/complaints_controller", __FILE__)

describe "New Complaint Page" do
  include Warden::Test::Helpers
  Warden.test_mode!

  subject { page }

  before do
    login_as FactoryGirl.create(:user), :scope => :user
    visit new_complaint_path
  end

  after { Warden.test_reset! }

  it { should have_content(I18n.t('complainment.new')) }

  context "Complaint without description" do
    before(:each) do
      click_button(I18n.t('buttons.complainment.new'))
    end

    it { should have_content I18n.t('messages.failure_complaint_save') }
  end

  context "Fill in complaint with description" do
    before(:each) do
      fill_in("complaint_title", :with => "Title")
      fill_in("complaint_description", :with => "Description")
      click_button(I18n.t('buttons.complainment.new'))
    end

    it { should have_content I18n.t('messages.success_complaint_save') }

    context "Add links to complaint" do
      before(:each) do
        #click_link(I18n.t('buttons.complainment.add_link'))
        fill_in("font_url", :with => "www.google.com")
      end
    end
  end
end