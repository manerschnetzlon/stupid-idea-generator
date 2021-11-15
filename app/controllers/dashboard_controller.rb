class DashboardController < ApplicationController

  def profile
    @likes = Like.where(user: current_user)
  end
end
