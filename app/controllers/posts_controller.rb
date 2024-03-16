class PostsController < ApplicationController
	layout 'application'
	before_action :load_post, only: [:edit, :update, :show, :destroy]

	def index
		@pagy, @posts = pagy(Post.with_comments.all, items: 10)
	end

	def show; end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		@post.save
		redirect_to post_path(@post)
	end

	def edit; end

	def update; end

	def destroy; end

	private

	def load_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, images: [])
	end
end