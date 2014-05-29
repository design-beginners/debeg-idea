# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build(body: params[:comment][:body], user: current_user)

    if @comment.save
      redirect_to @idea, notice: 'コメントを追加しました！'
    else
      @comments = @idea.comments
      render 'ideas/show'
    end
  end

  def destroy
    idea = Idea.find(params[:idea_id])
    comment = idea.comments.where(user: current_user).find(params[:id])
    comment.destroy!
    redirect_to idea_path(idea), notice: 'コメントを削除しました'
  end
end
