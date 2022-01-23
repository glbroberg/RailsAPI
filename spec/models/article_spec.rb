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

    it "has invalid content" do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it "has invalid slug" do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    context "Slug Tests" do
      before do      
        @article2 = FactoryBot.create(:article, slug: "test-slug-1")      
        
        @article3 = create(:article) # shorthand for line above, 'FactoryBot' can be omitted
        puts @article2.slug
        puts @article3.slug

      end

      it "Verify created slug-test article2 is valid" do
        expect(@article2).to be_valid
      end

      it "Verify created slug-test article3 is valid" do
        expect(@article3).to be_valid  
      end
      
      it "validates slug uniqueness" do      
        @article3.slug = "test-slug-1"    
        expect(@article3).not_to be_valid    
      end  
    end
  end
end
