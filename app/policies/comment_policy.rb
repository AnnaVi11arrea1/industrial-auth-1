class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment
  
  def initialize(user, comment)
    @user = user
    @comment = comment
  end
# Our policy is that a photo should only be seen by the owner or followers of the owner, unless the owner is not private in which case anyone can see it.
  def index?
    false
  end

  def show?
    false
  end

  def new?
    true
  end

  def edit?
    user == copmment.author
  end

  def create?
    true
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end
end
