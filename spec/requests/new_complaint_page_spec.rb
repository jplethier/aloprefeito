# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "New Complaint Page" do
  
  subject { page }

  before do
    # login_as FactoryGirl.create(:broker), :scope => :broker
    visit new_complaint_path
  end

  it { should have_content('Novo Usuário') }
  
  describe 'creating a complaint' do
    it 'successfully' do
      count = Complaint.count
      fill_in 'user_email', :with => 'user@ofertus.com.br'
      click_on 'submit'
      (Complaint.count - 1).should == count
      should have_content('Denúncia cadastrada com sucesso.')
      should have_content('Minhas denúncias')
    end
  end
end