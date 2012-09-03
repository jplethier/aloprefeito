#coding: UTF-8
require 'spec_helper'

describe Users::OmniauthCallbacksController do

  before do
    OmniAuth.config.add_mock(:facebook, {
      :uid => '12345',
      :nickname => 'zap',
      :info => {:first_name => 'zap',:last_name => 'nap',:email => 'zapnap@facebook.com'}, 
      :credentials => {:token => "qualquer_coisa"}
    })
    request.env["devise.mapping"] = Devise.mappings[:user] 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  describe 'facebook' do
    before do
      #get '/facebook/'
    end

    it "should sign in successfully" do
      pending
      should have_content('Olá, zap')
    end
  end
end
