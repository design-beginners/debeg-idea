# -*- coding: utf-8 -*-
require 'spec_helper'

describe '自分の作ったアイデアを削除する' do
  let!(:user) { create :user, uid: '12345' }
  let!(:user_idea) { create :idea, user: user }
  let!(:other_user_idea) { create :idea }

  context 'ログインしてトップページに遷移したとき' do
    before do
      login
      visit root_path
    end

    it '自分の作ったアイデアに削除ボタンが表示されていること' do
      expect(find("#idea_#{user_idea.id}")).to have_link '削除'
      expect(find("#idea_#{other_user_idea.id}")).to have_no_link '削除'
    end

    context '削除ボタンを押して、ダイアログで"OKをクリックしたとき"', js: true do
      before do
        find("#idea_#{user_idea.id}").click_link '削除'
      end

      it '自分の作ったアイデアが削除されていること' do
        expect(page).to have_no_css "#idea_#{user_idea.id}"
        expect(page).to have_css "#idea_#{other_user_idea.id}"
      end
    end
  end
end
