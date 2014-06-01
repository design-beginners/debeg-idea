class WelcomeController < ApplicationController
  def index
    @idea = Idea.new
    @q = IdeaOrderForm.new(params)
    @ideas = @q.result
  end
end
