# frozen_string_literal: true

require 'rails_helper'

describe '新規会員登録のテスト' do
  it "有効な登録内容の場合は保存されるか" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
end
