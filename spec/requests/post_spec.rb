require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  before(:all) do
    FactoryGirl.create_list(:post, 5)
    @new_post = Post.create!(
      title: "New post",
      body: "asdasdasd",
      username: "}|{onoPa3Pb|BaTeJIb"
    ).to_json
  end

  it 'receives responses in proper format' do
    get api_posts_path
    parsed_response = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it 'returns data correctly' do
    get api_posts_path
    parsed_response = JSON.parse(response.body)

    expect(parsed_response.first["title"]).to eq("Fake post")
  end

  it 'creates a new post' do
    headers = {
      "CONTENT_TYPE" => "application/json"
    }
    post api_posts_path, { params: { post: @new_post } } # не работает

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end
end
