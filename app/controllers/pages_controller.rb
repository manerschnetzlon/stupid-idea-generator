class PagesController < ApplicationController
  def home
    @ideas = Idea.all.order(created_at: :desc).limit(10)
  end
end
