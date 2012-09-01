# -*- encoding : utf-8 -*-
require 'spec_helper'
#require File.expand_path("../../../app/controllers/complaints_controller", __FILE__)

describe "New Complaint Page" do
  
  subject { page }

  before do
    # login_as FactoryGirl.create(:broker), :scope => :broker
    OmniAuth.config.add_mock(:facebook, {
      :uid => '12345',
      :nickname => 'zap',
      :info => {:first_name => 'zap',:last_name => 'nap',:email => 'zapnap@facebook.com'}, 
      :credentials => {:token => "qualquer_coisa"}
    })
    include Warden::Test::Helpers
    Warden.test_mode!
    visit "/users/auth/facebook"
    visit new_complaint_path
  end

  after { Warden.test_reset! }

  it { should have_content('Cadastrar Reclamação') }
  
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
