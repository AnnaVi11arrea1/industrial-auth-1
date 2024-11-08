class FollowRequestPolicy < ApplicationPolicy
  attr_reader :follow_request, :user
  
  def initialize(follow_request, user)
    @follow_request = follow_request
    @user = user
  end
  
  def index?
    false
  end

  def show?
    false
  end

  def new?
    !follow_request.recipient.followers.include?(@user)
  end

  def edit?
    user == follow_request.recipient
  end

  def create?
    !follow_request.recipient.followers.include?(@user)
  end

  def update?
    user == follow_request.recipient
  end

  def destroy?
    user == follow_request.recipient ||
      user == follow_request.sender
  end
end
