class PostsController < ApplicationController
before_filter :authorize, :except => [:index, :show]

def new
end

def create
	post = Post.new(post_params.merge(user_id: current_user.id))
	if post.save
		redirect_to '/'
	else
		redirect_to new_post_path
	end
end

def show
  @post = Post.find(params[:id])
  @user = User.find(Post.find(params[:id]).user_id) 
end


def index
  @posts = Post.all
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to root_path
end
private

def post_params
  params.require(:post).permit(:title, :body)
end

def authorize
	redirect_to '/login' unless current_user
end


end

