# -*- coding: utf-8 -*-
class IdeasController < ApplicationController
  def create
    @idea = Idea.new(title: params[:idea][:title])

    if @idea.save
      redirect_to root_path, notice: 'アイデアを追加しました！'
    else
      @ideas = Idea.order('created_at desc')
      render 'welcome/index'
    end
  end
end
