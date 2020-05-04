require "rails_helper"

RSpec.describe Article, type: :model do
  describe "正常テスト" do
    context "タイトル、本文が入力されているとき" do
      let(:article) { build(:article) }
      it "記事が投稿される" do
        expect(article).to be_valid
      end
    end

    context "下書きと公開記事として投稿する場合" do
      let(:article) { build(:article, status: "draft") }
      it "下書きと公開記事として投稿される" do
        aggregate_failures "testing items" do
          expect(article).to be_valid
          expect(article.status).to eq "draft"
        end
      end
    end
  end

  describe "異常テスト" do
    context "タイトルが入力されていないとき" do
      let(:article) { build(:article, title: nil) }
      it "エラーする" do
        article.valid?
        expect(article.errors.messages[:title]).to include "can't be blank"
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
