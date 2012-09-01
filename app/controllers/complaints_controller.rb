class ComplaintsController < ApplicationController
  def new
    
  end

  def index
    @complaints = Complaint.all
  end
end
