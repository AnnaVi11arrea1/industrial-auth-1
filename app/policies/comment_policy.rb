class CommentPolicy < ApplicationPolicy
  attr_reader :current_user, :user
  before_action :allowed [:show, :create, :update, :destroy]
  
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end
# Our policy is that a photo should only be seen by the owner or followers of the owner, unless the owner is not private in which case anyone can see it.
  def index?
    true
  end

  def show?
    user == current_user || !user.private? || user.followers.include?(current_user)
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def authorized?
   User.where(comment.id => comment.author_id)
  end
end
