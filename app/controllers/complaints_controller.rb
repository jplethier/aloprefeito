class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
    @fonts = @complaint.fonts
    @video = @complaint.embeds.first
    @map = @complaint.maps.first
    @pictures = @complaint.pictures

    @json = @complaint.maps.to_gmaps4rails

  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new params[:complaint]
    if @complaint.save
      flash[:error] = I18n.t('messages.success_complaint_save')
      redirect_to complaint_path(@complaint)
    else
      flash.now[:error] = I18n.t('messages.failure_complaint_save')
      render "new"
    end
  end

end
