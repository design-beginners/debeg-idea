# -*- coding: utf-8 -*-
class IdeasController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments
    @comment = Comment.new
  end

  def create
    @idea = current_user.ideas.build(title: params[:idea][:title])

    if @idea.save
      redirect_to root_path, notice: 'アイデアを追加しました！'
    else
      @ideas = Idea.order('created_at desc')
      render 'welcome/index'
    end
  end
end
