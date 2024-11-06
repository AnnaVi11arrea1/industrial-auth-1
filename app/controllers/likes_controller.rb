class LikesController < ApplicationController
  before_action :set_like, only: %i[ destroy ]

  before_action :is_an_authorized_user, only: [:destroy, :create]

  def is_an_authorized_user
    if !@like.owner.private? || @like.owner == current_user || current_user.leaders.include?(@like.owner)
      redirect_back(fallback_location: root_url, alert: "You are not authorized for this action.")
    end
  end


  def create
    @like = Like.new(like_params)
    authorize @like

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like, notice: "Like was successfully created." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json


  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:fan_id, :photo_id)
    end
end
