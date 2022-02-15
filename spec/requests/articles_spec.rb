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
      body = JSON.parse(response.body).deep_symbolize_keys
      pp body # logs body in more readable way
      expect(body).to eq(
        data: [
          {
            id: article.id.to_s,
            type: "article",
            attributes: {
              title: article.title,
              content: article.content,
              slug: article.slug,
            },
          },
        ],
      )
    end
  end
end
