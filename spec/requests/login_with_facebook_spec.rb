# -*- encoding : utf-8 -*-
require 'spec_helper'
#require File.expand_path("../../../app/controllers/complaints_controller", __FILE__)

describe "Sign in" do
  include Warden::Test::Helpers
  Warden.test_mode!
  
  subject { page }

  before do
    visit root_path
  end

  after { Warden.test_reset! }

  it { should have_link('Login with facebook', :href => user_omniauth_authorize_path(:facebook)) }
  
  describe 'successfully' do
    before do
      login_as FactoryGirl.create(:user, :first_name => 'zap'), :scope => :user
      visit root_path
      # OmniAuth.config.add_mock(:facebook, {
      #   :uid => '12345',
      #   :nickname => 'zap',
      #   :info => {:first_name => 'zap',:last_name => 'nap',:email => 'zapnap@facebook.com'}, 
      #   :credentials => {:token => "qualquer_coisa"}
      # })
    end
    
    it 'successfully' do
      # click_on 'Login with facebook'
      should have_content('Olá, zap')
    end
  end
end
