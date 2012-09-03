class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, User
    can [:edit, :update], User, :id => user.id
    can :read, Complaint

    #permissoes usuario_logado
    unless user.new_record?
      can [:new, :create], Complaint
      can :create, Comment
    end

    #permissoes admin
  end
end