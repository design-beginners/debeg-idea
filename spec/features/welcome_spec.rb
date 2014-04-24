# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'アイデアを見るためにトップページにアクセスする' do
  context 'トップページにアクセスしたとき' do
    before { visit root_path }

    it '"デザインビギナーズのアイデア帳"と表示されていること' do
      expect(page).to have_content 'デザインビギナーズのアイデア帳'
    end
  end
end
