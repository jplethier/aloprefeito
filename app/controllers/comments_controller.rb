class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    @comment.commentable = Complaint.find(params[:comment][:commentable_id])
    if @comment.save
      UserMailer.registration_confirmation(@comment.commentable.user).deliver
      flash[:success] = I18n.t('messages.success_comment_save')
      redirect_to complaint_path(@comment.commentable)
    else
      flash.now[:error] = I18n.t('messages.failure_comment_save')
      redirect_to complaint_path(@comment.commentable_id)
    end
  end
end
