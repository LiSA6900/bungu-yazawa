# frozen_string_literal: true

require 'rails_helper'

describe '新規会員登録のテスト' do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  it '正常に新規会員登録ができるか' do
    expect {
      post :create, params: {
        customer: {
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
        }
      }
    }.to change(@customer, :count).by(1)
  end
  
  it '新規会員登録後に問い合わせフォーム画面へリダイレクトされているか' do
    sign_in @customer
    post :create, params: {
      customer: {
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
      }
    }
    expect(response).to redirect_to "/inquiries/new"
  end
end