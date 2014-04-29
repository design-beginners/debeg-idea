# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'アイデアに関する情報をコメントとして投稿する' do
  let(:idea) { create :idea }

  context '未ログイン状態でアイデア詳細ページにアクセスしたとき' do
    before { visit idea_path(idea) }

    it 'コメント投稿用のフォームが表示されていないこと' do
      expect(page).to have_no_css '#new_comment'
    end
  end

  context 'ログイン状態でアイデア詳細ページにアクセスしたとき' do
    before do
      login
      visit idea_path(idea)
    end

    it 'コメント投稿用のフォームが表示されていること' do
      expect(page).to have_css '#new_comment'
    end

    context 'かつ、コメントを入力して"コメントを送信する"をクリックしたとき' do
      before do
        fill_in 'comment_body', with: '素晴らしいコメント'
        click_button 'コメントを送信する'
      end

      it '"コメントを追加しました！"と表示されていること' do
        expect(page).to have_content 'コメントを追加しました！'
      end

      it '登録したコメントが表示されていること' do
        expect(page).to have_content '素晴らしいコメント'
      end
    end
  end
end
