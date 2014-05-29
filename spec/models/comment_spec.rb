# -*- coding: utf-8 -*-
require 'spec_helper'

describe Comment do
  it { should belong_to(:idea) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_most(1000) }
  it { should belong_to(:user) }

  describe '#created_by?' do
    let(:idea) { build(:idea) }
    subject { idea.created_by?(user) }

    context '引数が nil のとき' do
      let(:user) { nil }

      it { should eq false }
    end

    context '引数の #id が #user_id と等しいとき' do
      let(:user) { idea.user }

      it { should eq true }
    end

    context '引数の #id が #user_id と異なるとき' do
      let(:user) { double('user', id: idea.user_id + 1) }

      it { should eq false }
    end
  end
end
