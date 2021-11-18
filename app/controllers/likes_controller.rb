class LikesController < ApplicationController

  def create
    @like = Like.new(user: current_user, idea: Idea.find(params[:idea_id]))
    @like.save
    # notice = 'Zut un problème est survenu' unless @like.save
    # save_redirection(@like, notice)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    # notice = 'Zut un problème est survenu' unless @like.destroy
    # save_redirection(@like, notice)
  end

  private

  def save_redirection(like, notice)
    if params[:from_page] == 'index'
      redirect_to ideas_path, notice: notice
    else
      redirect_to idea_path(like.idea)
    end
  end
end
