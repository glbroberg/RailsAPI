require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '#validations' do
    let (:article) {build(:article)}  # ':article' => factory name - from factorybot
    it "Test that factory is valid" do
      # article = create(:article) -> actually creates and writes article to the DB, which is not nessicary to test the factory
      
      expect(article).to be_valid # atricle.valid? = true
    end

    it "has an invalid title" do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
  end
end
