class PostsController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :new, :create, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = '正常に投稿されました'
      redirect_to "/"
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    agent_id = post.agent.id
    
    if post.destroy
      flash[:success] = '正常に削除されました'
      redirect_to agent_path(agent_id)
    else
      flash.now[:danger] = '削除されませんでした'
      redirect_back(fallback_location: agent_path(agent_id))
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content).merge(agent_id: params[:agent_id])
  end
end
