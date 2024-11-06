class FollowRequestsController < ApplicationController

  before_action :set_follow_request, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_owner, only: [:edit, :update, :destroy]
  before_action :ensure_user_is_authorized, only: [:show]
  before_action { authorize(@follow_request || FollowRequest) }
  # GET /follow_requests or /follow_requests.json
  def index
    @follow_requests = FollowRequest.all
  end

  # GET /follow_requests/1 or /follow_requests/1.json
  def show
    authorize @follow_request
  end

  # GET /follow_requests/new
  def new
    @follow_request = FollowRequest.new
  end

  # GET /follow_requests/1/edit
  def edit
    authorize @follow_request
  end

  private

  def ensure_user_is_authorized
    if !FollowRequestPolicy.new(current_user, @follow_requests).show?
      raise Pundit::NotAuthorizedError, "nah"
    end
  end
    


end
