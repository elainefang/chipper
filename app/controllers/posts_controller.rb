class PostsController < ActionController::Base
    layout 'application'
    before_action :load_user

    def index; end

    def show; end

    def new; end

    def create; end

    def edit; end

    def update; end

    def destroy; end

    private

    def load_user
        @user = User.find(params[:user_id])
    end
end