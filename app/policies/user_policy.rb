class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def show_photos?
    user == current_user ||
    !user.private? || 
    user.followers.include?(current_user)
  end

  def liked?
    true
  end

  def feed?
    # user.leaders.include?(current_user)
    # user.followers.include?(current_user)
  end

  def discover?
    true
  end
end
