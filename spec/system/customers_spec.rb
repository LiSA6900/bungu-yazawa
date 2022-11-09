# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーログインのテスト' do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  it '正常にログインができるか' do
    # ユーザーを作成
    @customer = Customer.create(
      last_name: '山田',
      first_name: '太郎',
      last_name_kana: 'ヤマダ',
      first_name_kana: 'タロウ',
      postal_code: '000-0000',
      address: '静岡県静岡市葵区0-0',
      telephone_number: '080-0000-0000',
      email: 'test@test.com',
      password: '000000'
      is_deleted: false
    )
    
    # トップページへアクセス
    visit root_path
    
    # ログインページへ遷移
    click_link 'ログイン'
    
    # メールアドレスとパスワードを入力
    fill_in 'Email', with: @customer.email
    fill_in 'Password', with: @customer.password
    click_button 'ログイン'
    
    expect(page).to have_content '"ようこそ"+ @customer.last_name +"さん"', 'ログアウト'
  end
end