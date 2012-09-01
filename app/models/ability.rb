class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, User
    can [:edit, :update], User, :id => user.id
    can :read, Complaint

    #permissoes usuario_logado
    unless user.new_record?
      can :create, Complaint
      can :update, Complaint, :user_id => user.id
    end

    #permissoes admin
  end
end