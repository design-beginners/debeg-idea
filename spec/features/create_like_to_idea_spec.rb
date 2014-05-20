# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'よいアイデアに"イイネ！"をする' do
  before { create :idea }

  context '未ログイン状態でトップページにアクセスしたとき' do
    before { visit root_path }

    it 'イイネ！ボタンが表示されていないこと' do
      expect(page).to have_no_css '.btn.js-like'
    end
  end

  context 'ログイン状態でトップページにアクセスしたとき' do
    before do
      login
      visit root_path
    end

    it 'イイネ！ボタンが表示されていること' do
      expect(find('.btn.js-like')).to have_content 'イイネ！'
    end

    context 'かつ、イイネ！をクリックしたとき', js: true do
      before { click_link 'イイネ！' }

      it '"イイネ！" が "イイネ！済み" になり、disabled になっていること' do
        expect(page).to have_no_css '.btn.js-like'
        expect(find('.btn.disabled')).to have_content 'イイネ！済み'
      end
    end
  end
end
