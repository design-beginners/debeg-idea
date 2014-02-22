class WelcomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.order('created_at desc')
  end
end
