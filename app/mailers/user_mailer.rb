class UserMailer < ActionMailer::Base


  def new_comment(user)
    mail(:to => user.email, :subject => "Novo Comentario", :from => "noreply@aloprefeito.com")
  end
end