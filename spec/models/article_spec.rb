require "rails_helper"

RSpec.describe Article, type: :model do
  describe "正常テスト" do
    context "タイトル、本文が入力されているとき" do
      let(:article) { build(:article) }
      it "記事が投稿される" do
        expect(article).to be_valid
      end
    end
  end

  describe "異常テスト" do
    context "タイトルが入力されていないとき" do
      let(:article) { build(:article, titile: nil) }
      it "エラーする" do
        article.valid?
        expect(article.errors.messages[:titile]).to include "can't be blank"
      end
    end

    context "本文が入力されていないとき" do
      let(:article) { build(:article, body: nil) }
      it "エラーする" do
        article.valid?
        expect(article.errors.messages[:body]).to include "can't be blank"
      end
    end
  end
end
