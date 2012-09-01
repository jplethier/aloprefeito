class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
    @fonts = @complaint.fonts
    @embed = @complaint.embeds.first
    @map = @complaint.maps.first
    @pictures = @complaint.pictures
  end

  def new
    
  end

end
