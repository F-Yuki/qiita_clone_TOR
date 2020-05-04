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
        let(:user) { build(:user, name: nil) }
        it "エラーです" do
          user.valid?
          expect(user.errors.messages[:name]).to include "can't be blank"
        end
      end
    end

    describe "アカウントについて" do
      context "アカウントが入力されていないとき" do
        let(:user) { build(:user, account: nil) }
        it "エラーです" do
          user.valid?
          expect(user.errors.messages[:account]).to include "can't be blank"
        end
      end
    end

    describe "emailについて" do
      context "emailが入力されていないとき" do
        let(:user) { build(:user, email: nil) }
        it "エラーです" do
          user.valid?
          expect(user.errors.messages[:email]).to include "can't be blank"
        end
      end

      context "同一のemailが存在する" do
        before { create(:user, email: "fushifushi@example.com") }

        let(:user) { build(:user, email: "fushifushi@example.com") }
        it "エラーです" do
          user.valid?
          expect(user.errors.messages[:email]).to include "Already used"
        end
      end

      context "emailに@が含まれない時" do
        let(:user) { build(:user, email: "fushifushiexample.com") }
        it "エラーする" do
          user.valid?
          expect(user.errors.messages[:email]).to include "is not an email"
        end
      end
    end

    describe "パスワードについて" do
      context "パスワードが入力されていない時" do
        let(:user) { build(:user, password: nil) }
        it "エラーする" do
          user.valid?
          expect(user.errors.messages[:password]).to include "can't be blank"
        end
      end
    end
  end
end
