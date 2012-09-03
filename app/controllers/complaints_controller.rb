class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :new]
  
  #def tags
  #  query = params[:q]
  #  if query[-1,1] == " "
  #    query = query.gsub(" ", "")
  #    ActsAsTaggableOn::Tag.find_or_create_by_name(query)
  #  end
  #
  #  #Do the search in memory for better performance
  #
  #  @tags = ActsAsTaggableOn::Tag.acll
  #  @tags = @tags.select { |v| v.name =~ /#{query}/i }
  #  respond_to do |format|
  #    format.json{ render :json => @tags.map(&:attributes) }
  #  end
  #end

  def show
    @complaint = Complaint.find(params[:id])
    @fonts = @complaint.fonts
    @video = @complaint.embeds.first
    @map = @complaint.maps.first
    @pictures = @complaint.pictures
    @comments = @complaint.comments.order("created_at DESC")

    @json = @complaint.maps.to_gmaps4rails
    @comment = @complaint.comments.build
  end

  def new
    @complaint = Complaint.new
    3.times do
      @complaint.fonts.build
      @complaint.pictures.build
    end
    @complaint.embeds.build
    @complaint.maps.build
  end

  def create
    @complaint = Complaint.new params[:complaint]
    if @complaint.save
      flash[:success] = I18n.t('messages.success_complaint_save')
      redirect_to complaint_path(@complaint)
    else
      flash.now[:error] = I18n.t('messages.failure_complaint_save')
      render "new"
    end
  end

end
