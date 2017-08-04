module Api
  class PostsController < ApplicationController
    before_action :set_post, only: [:update, :destroy]

    def index
      @posts = Post.all

      render json: @posts, status: :ok
    end

    def create
      @post = Post.create!(post_params)

      render_post
    end

    def update
      @post.update(post_params)

      render_post
    end

    def destroy
      @post.delete

      head :no_content
    end

    private
      def post_params
        params.require(:post).permit(:title, :body, :username)
      end

      def set_post
        @post = Post.find(params[:id])
      end

      def render_post
        render json: @post, status: :ok
      end
  end
end
