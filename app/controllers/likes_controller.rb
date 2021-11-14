class LikesController < ApplicationController
  def create
    @like = Like.new(user: current_user, idea: Idea.find(params[:idea_id]))
    if @like.save
      redirect_to ideas_path
    else
      notice = 'Zut un problème est survenu'
      redirect_to ideas_path, notice: notice
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to ideas_path
    else
      notice = 'Zut un problème est survenu'
      redirect_to ideas_path, notice: notice
    end
  end
end
