class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
    @fonts = @complaint.fonts
    @embed = @complaint.embed
    @maps = @complaint.gmaps
    @pictures = @complaint.pictures
  end

  def new
    
  end

end
