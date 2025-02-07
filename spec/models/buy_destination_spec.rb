require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    buy = FactoryBot.create(:buy, user_id: user.id, item_id: item.id)
    @buydestination = FactoryBot.build(:buy_destination, user_id: user.id, item_id: item.id, buy_id: buy.id)
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '郵便番号と都道府県と市区町村と番地と電話番号とトークンがあれば購入できる' do
        expect(@buydestination).to be_valid
      end
      it '建物名がなくても登録できる' do
        @buydestination.building_name = ''
        expect(@buydestination).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号が空では購入できない' do
        @buydestination.post_code = ''
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Post code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @buydestination.post_code = '0992231'
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Post code ise invalid. Include hyphen(-)")
      end
      it '都道府県が未選択では購入できない' do
        @buydestination.region_id = '1'
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Region can't be blank")
      end
      it '市区町村が空では購入できない' do
        @buydestination.city = ''
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @buydestination.street_address = ''
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Street address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @buydestination.telephone = ''
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Telephone can't be blank")
      end
      it '電話番号は10桁以上でないと購入できない' do
        @buydestination.telephone = '111111111'
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Telephone は10桁以上11桁以内の半角数字で入力してください")
      end
      it '電話番号が11桁以内でないと購入できない' do
        @buydestination.telephone = '111111111111'
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Telephone は10桁以上11桁以内の半角数字で入力してください")
      end
      it '電話番号は半角数値のみ登録できる' do
        @buydestination.telephone = '１１１１１１１１１１'
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Telephone は10桁以上11桁以内の半角数字で入力してください")
      end
      it 'userが紐づいていないと保存できない' do
        @buydestination.user_id = nil
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @buydestination.item_id = nil
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Item can't be blank")
      end
      it 'トークンが空では登録できない' do
        @buydestination.token = ''
        @buydestination.valid?
        expect(@buydestination.errors.full_messages). to include("Token can't be blank")
      end
    end
  end
end