class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request
  
  def initialize(user, follow_request)
    @follow_request = follow_request
    @user = user
  end

  def create?
    follow_request.sender == user || follow_request.recipient == user
  end

  def update?
    follow_request.sender == user || follow_request.recipient == user
  end

  def edit?
    follow_request.sender == user || follow_request.recipient == user
  end
end
