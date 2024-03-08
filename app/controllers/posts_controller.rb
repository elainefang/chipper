class PostsController < ActionController::Base
	layout 'application'
	before_action :load_post, only: [:edit, :update, :show, :destroy]

	def index; end

	def show; end

	def new; end

	def create; end

	def edit; end

	def update; end

	def destroy; end

	private

	def load_post
		@post = Post.find(params[:id])
	end
end