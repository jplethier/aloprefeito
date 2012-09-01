class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    #@json = Attachment.new(:latitude => 0, :longitude => 0).to_gmaps4rails do |location, marker|
    #  #marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user})
    #  marker.picture({
    #                     :width   => 32,
    #                     :height  => 32
    #                 })
    #  marker.title   "Title"
    #  marker.sidebar "i'm the sidebar"
    #  marker.json({ :id => 1, :foo => "bar" })
    #end
    @json = Attachment.mappable.to_gmaps4rails do |attachment, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => {:attachment => attachment})
    end
  end
end
