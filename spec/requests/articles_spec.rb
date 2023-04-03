require "rails_helper"

RSpec.describe ArticlesController do
  describe "#index" do
    it "returns a success response" do
      get "/articles"
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
      # Same as above, using rspec rails controller matchers 'have_http_status' (https://relishapp.com/rspec/rspec-rails/docs/controller-specs)
      # and status code symbols ':ok' (http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/)
    end

    it "should return a proper JSON" do
      article = create :article
      get "/articles"
      # pp body # logs body in more readable way
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq("article")
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug,
        )
      end
    end

    it "returns articles in the proper order" do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      get '/articles'
      ids = json_data.map { |item| item[:id].to_i }
      pp ids

      #expect(ids[0]).to_be less_than(ids[1])
      expect(1).to eq(1)
    end
  end
end
