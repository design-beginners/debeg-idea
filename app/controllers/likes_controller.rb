class LikesController < ApplicationController
  before_action :authenticate

  def create
    idea = Idea.find(params[:idea_id])
    comment_id = params[:comment_id]

    likable = if comment_id
                idea.comments.find(comment_id)
              else
                idea
              end
    likable.likes.create!(user: current_user)

    head 201
  end
end
