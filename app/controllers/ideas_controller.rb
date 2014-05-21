# -*- coding: utf-8 -*-
class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments
    @comment = Comment.new
  end

  def create
    @idea = if logged_in?
              current_user.ideas.build(title: params[:idea][:title])
            else
              Idea.new(title: params[:idea][:title])
            end

    if @idea.save
      redirect_to root_path, notice: 'アイデアを追加しました！'
    else
      @ideas = Idea.order('created_at desc')
      render 'welcome/index'
    end
  end
end
