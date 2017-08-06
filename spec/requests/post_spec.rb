require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  let(:updated_post) { { :body => "corrected body", :username => "totally_awesome_guy" } }

  before(:all) do
    FactoryGirl.create_list(:post, 5)
    @new_post = {
      title: "New post",
      body: "asdasdasd",
      username: "some_weird_dude"
    }
  end

  it 'receives responses in proper format' do
    get api_posts_path

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it 'returns data correctly' do
    get api_posts_path

    expect(json.first["title"]).to eq("Fake post")
  end

  it 'shows all posts' do
    get api_posts_path

    expect(json.length).to eq(5)
  end

  it 'creates a new post' do
    post api_posts_path, as: :json, params: @new_post

    expect(json["body"]).to eq("asdasdasd")
  end

  it 'updates an existing post' do
    put '/api/posts/2', as: :json, params: updated_post

    expect(json["body"]).to eq("corrected body")
    expect(json["username"]).to eq("totally_awesome_guy")
  end

  it 'deletes a post' do
    delete '/api/posts/5'

    expect(Post.all.length).to eq(4)
  end
end
