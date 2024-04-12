class FollowersController < ApplicationController

  def create
    @follower = Follower.new(
      user_id: params[:user_id],
      follower_id: current_user.id
    )
    @follower.save
    redirect_to user_path(@follower.user_id)
  end

  def destroy
  end

  private
end
