# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Sign out" do
  include Warden::Test::Helpers
  Warden.test_mode!
  
  subject { page }

  before do
    login_as FactoryGirl.create(:user, :first_name => 'zap'), :scope => :user
    visit root_path
  end

  after { Warden.test_reset! }

  it { should have_link('Sair', :href => logout_path) }
  
  it 'successfully' do
    click_on 'Sair'
    should have_link('Login with facebook')
  end
end
