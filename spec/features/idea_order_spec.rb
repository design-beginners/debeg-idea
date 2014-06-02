# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'イイネ！が多いアイデアを見たいので、イイネ！順にソートする' do
  before do
    idea_1 = create(:idea, title: 'hoge', created_at: 1.day.ago)
    idea_2 = create(:idea, title: 'fuga', created_at: 2.days.ago)
    idea_3 = create(:idea, title: 'foo',  created_at: 3.days.ago)

    create_list(:like_idea, 2, likable: idea_2)
    create_list(:like_idea, 1, likable: idea_3)
  end

  context 'トップページにアクセスしたとき' do
    before { visit root_path }

    it 'ソート順を設定できるセレクトボックスが表示されていること' do
      expect(page).to have_css '#idea_order_form_content'
    end

    it '作成日順にアイデアが表示されていること' do
      idea_ary = page.all('.idea a').map { |i| i.text.gsub(/\s/, '') }
      expect(idea_ary).to eq %w(hoge fuga foo)
    end

    context 'かつ、セレクトボックスをイイネ順に変更したとき', js: true do
      before { select 'イイネ順', from: 'idea_order_form_content' }

      it 'イイネ順にアイデアが表示されていること' do
        sleep 1
        idea_ary = page.all('.idea a').map { |i| i.text.gsub(/\s/, '') }
        expect(idea_ary).to eq %w(fuga foo hoge)
      end
    end
  end
end
