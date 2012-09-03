class UserMailer < ActionMailer::Base
  default :from => "noreply@aloprefeito.com"

  def new_comment(user)
    if user && user.email
      mail(:to => user.email, :subject => "Novo Comentario")
    end
  end
end