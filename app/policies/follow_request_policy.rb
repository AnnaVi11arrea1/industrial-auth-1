class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request
  
  def initialize(user, follow_request)
    @follow_request = follow_request
    @user = user
  end

  def index?
    
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end
end
