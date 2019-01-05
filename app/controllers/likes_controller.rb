class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.like(current_user)
    flash[:success] = 'micropostをお気に入りに登録しました。'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    micropost = Like.find(params[:id]).micropost
    micropost.dislike(current_user)
    flash[:success] = 'micropostのお気に入りを解除しました。'
    redirect_to likes_user_path(current_user)
  end
end
