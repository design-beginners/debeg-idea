# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  describe '.find_or_create_from_auth_hash' do
    let(:auth_hash) do
      {
        provider: 'twitter',
        uid: 'uid',
        info: {
          nickname: 'netwillnet',
          image: 'http://example.com/netwillnet.jpg'
        }
      }
    end
    
    context '引数のproviderとuidに対応するUserが作成されていないとき' do
      it '引数で設定した属性のUserオブジェクトが返ること' do
        user = User.find_or_create_from_auth_hash(auth_hash)
        expect(user.provider).to eq 'twitter'
        expect(user.uid).to eq 'uid'
        expect(user.nickname).to eq 'netwillnet'
        expect(user.image_url).to eq 'http://example.com/netwillnet.jpg'
        expect(user).to be_persisted
      end

      it 'Userモデルのレコードが一件増えていること' do
        expect { User.find_or_create_from_auth_hash(auth_hash) }.
          to change { User.count }.from(0).to(1)
      end
    end

    context '引数のproviderとuidに対応するUserが作成されているとき' do
      let!(:created_user) { create :user, provider: 'twitter', uid: 'uid' }

      it '引数に対応するUserレコードのオブジェクトが返ること' do
        user = User.find_or_create_from_auth_hash(auth_hash)
        expect(user).to eq created_user
      end

      it 'Userモデルのレコード件数が変化していないこと' do
        expect { User.find_or_create_from_auth_hash(auth_hash) }.
          not_to change { User.count }
      end
    end
  end
end
