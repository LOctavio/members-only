class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        redirect_to do |format|
            if @post.save
                format.html { redirect_to root_path, notice: 'Post was successfully created.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def index
        @posts = Post.all
        @post = Post.new
    end

    private
    def post_params
        params.require(:post).permit(:post_body)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
