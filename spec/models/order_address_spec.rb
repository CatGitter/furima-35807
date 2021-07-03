require 'rails_helper'

describe OrderAddress do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    sleep (1)
  end

  describe '商品購入情報の保存' do
    context '内容に問題がない場合' do
      it 'postal、prefecture_id、municipality、address、building、phone_number、order、tokenがあれば保存できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalが空だと保存できない' do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank")
      end

      it 'prefectureが空だと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'municipalityが空だと保存できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空だと保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postalが「2桁以下ハイフン4桁」だと保存できない' do
        @order_address.postal = '00-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'postalが「4桁以上ハイフン4桁」だと保存できない' do
        @order_address.postal = '0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'postalが「3桁ハイフン3桁以下」だと保存できない' do
        @order_address.postal = '000-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'postalが「3桁ハイフン5桁以上」だと保存できない' do
        @order_address.postal = '000-00000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'potalが全角文字列だと保存できない' do
        @order_address.postal = '０００−００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'postalが数値のみだと保存できない' do
        @order_address.postal = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end

      it 'phone_numberが9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '123456789000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角数字では保存できない' do
        @order_address.phone_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角文字では保存できない' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐づいていなければ保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていなければ保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
