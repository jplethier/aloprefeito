class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, User
    can [:edit, :update], User, :id => user.id

  end
end