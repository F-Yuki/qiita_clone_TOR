require "rails_helper"

RSpec.describe User, type: :model do
  describe "正常テスト" do
    context "名前,アカウント,email,パスワードが入力されているとき" do
      let(:user) { build(:user) } # let（共通処理の変数化）let(:定義名) {定義の内容、つまりRspecで行う処理} build/FactoryBotのインスタンスを作るメソッド
      it "ユーザが作成できる" do
        expect(user).to be_valid # matcher(be_***)
      end
    end
  end

  describe "異常テスト" do
    describe "名前について" do
      context "名前が入力されていないとき" do
        it "エラーです" do
          user = build(:user, name: nil)
          user.valid?
          expect(user.errors.messages[:name]).to include "can't be blank"
        end
      end
    end

    describe "アカウントについて" do
      context "アカウントが入力されていないとき" do
        it "エラーです" do
          user = build(:user, account: nil)
          user.valid?
          expect(user.errors.messages[:account]).to include "can't be blank"
        end
      end
    end

    describe "emailについて" do
      context "emailが入力されていないとき" do
        it "エラーです" do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors.messages[:email]).to include "can't be blank"
        end
      end

      context "同一のemailが存在する" do
        it "エラーです" do
          create(:user, email: "fushifushi@example.com")
          user = build(:user, email: "fushifushi@example.com")
          user.valid?
          expect(user.errors.messages[:email]).to include "Already used"
        end
      end

      context "emailに@が含まれない時" do
        it "エラーする" do
          user = build(:user, email: "tsuruokaexample.com")
          user.valid?
          expect(user.errors.messages[:email]).to include "is not an email"
        end
      end
    end

    describe "パスワードについて" do
      context "パスワードが入力されていない時" do
        it "エラーする" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors.messages[:password]).to include "can't be blank"
        end
      end
    end
  end
end
