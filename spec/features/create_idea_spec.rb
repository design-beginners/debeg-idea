# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'やってみたいことをアイデアとして投稿する' do
  context '未ログイン状態でトップページにアクセスしたとき' do
    before { visit root_path }

    it 'アイデア投稿用のフォームが表示されていること' do
      expect(page).to have_css '#new_idea'
    end

    context 'かつ、アイデアを入力して"アイデアを送信する"をクリックしたとき' do
      before do
        fill_in 'idea_title', with: '素晴らしいアイデア'
        click_button 'アイデアを送信する'
      end

      it '"アイデアを追加しました！"と表示されていること' do
        expect(page).to have_content 'アイデアを追加しました！'
      end

      it '登録したアイデアが表示されていること' do
        expect(page).to have_content '素晴らしいアイデア'
      end
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

    context 'かつ、アイデアを入力して"アイデアを送信する"をクリックしたとき' do
      before do
        fill_in 'idea_title', with: '素晴らしいアイデア'
        click_button 'アイデアを送信する'
      end

      it '"アイデアを追加しました！"と表示されていること' do
        expect(page).to have_content 'アイデアを追加しました！'
      end

      it '登録したアイデアが表示されていること' do
        expect(page).to have_content '素晴らしいアイデア'
      end
    end
  end
end
