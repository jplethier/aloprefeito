class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @json = Attachment.mappable.to_gmaps4rails do |attachment, marker|
      marker.title "Sou um titulo"
      marker.infowindow render_to_string(:partial => "infowindow", :locals => {:attachment => attachment})
      #marker.sidebar "sousidebar"
      marker.sidebar render_to_string(:partial => "sidebar", :locals => {:attachment => attachment})
    end
  end
end
