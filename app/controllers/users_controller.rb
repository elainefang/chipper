class UsersController <  ApplicationController
  def show
    @user = User.find(params[:id])
    @pagy, @posts = pagy(@user.posts, items: 10)
  end
end