require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "正常テスト" do
    context "コメントが入力されているとき" do
      let(:comment) { build(:comment) }
      it "投稿できます" do
        expect(comment).to be_valid
      end
    end
  end

  describe "異常テスト" do
    context "コメントが入力されていないとき" do
      let(:comment) { build(:comment, body: nil) }
      it "投稿できません" do
        comment.valid?
        expect(comment.errors.messages[:body]).to include "can't be blank"
      end
    end
  end
end
