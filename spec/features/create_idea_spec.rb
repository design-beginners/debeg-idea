# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'やってみたいことをアイデアとして投稿する' do
  context '未ログイン状態でトップページにアクセスしたとき' do
    before { visit root_path }

    it 'アイデア投稿用のフォームが表示されていないこと' do
      expect(page).to have_no_css '#new_idea'
    end
  end

  context 'ログイン状態でトップページにアクセスしたとき' do
    before do
      login
      visit root_path
    end

    it 'アイデア投稿用のフォームが表示されていること' do
      expect(page).to have_css '#new_idea'
    end
  end
end
