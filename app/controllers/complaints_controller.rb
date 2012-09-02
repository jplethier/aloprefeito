class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :new, :create, :tags]
  
  def tags 
    @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{params[:q]}%") 
    respond_to do |format|
      format.json { render :json => @tags.map{|t| {:id => t.name, :name => t.name }}}
    end
  end
  
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
    @complaint.build_fonts
  end

  def create
    @complaint = Complaint.new params[:complaint]
    @complaint.description = 'aff'
    if @complaint.save
      flash[:error] = I18n.t('messages.success_complaint_save')
      redirect_to complaint_path(@complaint)
    else
      binding.pry
      flash.now[:error] = I18n.t('messages.failure_complaint_save')
      render "new"
    end
  end

end
