class PagesController < ApplicationController
  def home
    @ideas = Idea.all
  end
end
