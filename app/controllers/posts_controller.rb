class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new
    end

    private
    def post_params
        params.require(:post).permit(:post_body)
    end
end
