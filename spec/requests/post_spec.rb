require 'rails_helper'

RSpec.describe 'Posts API' do
  let!(:post) { create(:post) }

  it 'renders all posts' do
    get "/api/posts"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  # it 'creates a new post' do
  #   headers = {
  #     "CONTENT_TYPE" => "application/json"
  #   }
  #   post "/api/posts", { :post => post }, headers
  #
  #   expect(response.content_type).to eq("application/json")
  #   expect(response).to have_http_status(:ok)
  # end
end
