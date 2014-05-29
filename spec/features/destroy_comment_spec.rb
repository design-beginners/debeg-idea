# -*- coding: utf-8 -*-
require 'spec_helper'

describe '通常ユーザが自分の書いたコメントを削除する' do
  let!(:user) { create :user, uid: '12345' }
  let!(:other_user) { create :user }
  let!(:idea) { create :idea, user: user }

  let!(:user_comment) { create :comment, user: user, idea: idea }
  let!(:other_user_comment) { create :comment, user: other_user, idea: idea }

  context 'ログインしてアイデアページに遷移したとき' do
    before do
      login
      visit idea_path(idea)
    end

    it '自分の書いたコメントに削除ボタンが表示されていること' do
      expect(find("#comment_#{user_comment.id}")).to have_link '削除'
      expect(find("#comment_#{other_user_comment.id}")).to have_no_link '削除'
    end

    context '削除ボタンを押して、ダイアログで"OKをクリックしたとき"', js: true do
      before do
        find("#comment_#{user_comment.id}").click_link '削除'
      end

      it '自分の書いたコメントが削除されていること' do
        expect(page).to have_no_css "#comment_#{user_comment.id}"
        expect(page).to have_css "#comment_#{other_user_comment.id}"
      end
    end
  end
end

describe 'スーパーユーザがコメントを削除する' do
  let!(:user) { create :user, uid: '12345' }
  let!(:other_user) { create :user }
  let!(:idea) { create :idea, user: user }

  let!(:user_comment) { create :comment, user: user, idea: idea }
  let!(:other_user_comment) { create :comment, user: other_user, idea: idea }

  let!(:user) { create :user, :admin, uid: '12345' }
  let!(:user_idea) { create :idea, user: user }
  let!(:other_user_idea) { create :idea }

  context 'ログインしてアイデアページに遷移したとき' do
    before do
      login
      visit idea_path(idea)
    end

    it 'すべてのコメントに削除ボタンが表示されていること' do
      expect(find("#comment_#{user_comment.id}")).to have_link '削除'
      expect(find("#comment_#{other_user_comment.id}")).to have_link '削除'
    end

    context '自分以外のユーザが書いたコメントの削除ボタンを押して、ダイアログで"OKをクリックしたとき"', js: true do
      before do
        find("#comment_#{other_user_comment.id}").click_link '削除'
      end

      it '対象のコメントが削除されていること' do
        expect(page).to have_css "#comment_#{user_comment.id}"
        expect(page).to have_no_css "#comment_#{other_user_comment.id}"
      end
    end
  end
end
