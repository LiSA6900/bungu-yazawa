# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  
  describe '新規会員登録のテスト' do
    
    it '正常に新規会員登録ができるか' do

    # トップページへアクセス
    visit root_path
    # 新規会員登録画面へ遷移
    click_link 'signup'
    
    # 登録情報を入力し、新規登録ボタンをクリック
    fill_in "customer[last_name]", with: "山田"
    fill_in "customer[first_name]", with: "太郎"
    fill_in "customer[last_name_kana]", with: "ヤマダ"
    fill_in "customer[first_name_kana]", with: "タロウ"
    fill_in "customer[postal_code]", with: "0000000"
    fill_in "customer[address]", with: "静岡県静岡市葵区0-0"
    fill_in "customer[telephone_number]", with: "08012345678"
    fill_in "customer[email]", with: "test@test.com"
    fill_in "customer[password]", with: "Abcdef"
    click_button "新規登録"

    # 新規会員登録後に下記の文字列が存在（表示）するか
    expect(page).to have_content "ログアウト"
    end
  end
  
  
  describe 'ユーザーログインのテスト' do
    # before do
      # @customer = FactoryBot.create(:customer)
    # end
    
    it '正常にログインができるか' do
      # ユーザーを作成
      @customer = Customer.create(
        last_name: '山田',
        first_name: '太郎',
        last_name_kana: 'ヤマダ',
        first_name_kana: 'タロウ',
        postal_code: '0000000',
        address: '静岡県静岡市葵区0-0',
        telephone_number: '08012345678',
        email: 'test@test.com',
        password: 'Abcdef',
        is_deleted: false
      )
      
      # トップページへアクセス
      visit root_path
      # ログインページへ遷移
      click_link 'login'
      
      # メールアドレスとパスワードを入力
      fill_in 'customer[email]', with: @customer.email
      fill_in 'customer[password]', with: @customer.password
      click_button 'ログイン'
      
      # ログイン後の画面に下記の文字列が存在（表示）するか
      expect(page).to have_content("ようこそ、"+@customer.last_name+"さん")
    end
  end

end