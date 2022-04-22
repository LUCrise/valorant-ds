class AgentsController < ApplicationController
  
  before_action :require_user_logged_in, only: :show
  before_action :admin_user, only: [:new, :create, :destroy]
  
  def new
    @agent = Agent.new
  end
  
  def create
    @agent = current_user.agents.build(agent_params)

    if @agent.save
      redirect_to "/"
    else
      render :new
    end
  end

  def show
    @agents = Agent.all
    @agent = Agent.find(params[:id])
    @posts = Post.where(agent_id:@agent.id)
  end

  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy
    redirect_to "/"
  end
  
  private
    # Strong Parameter
  def agent_params
    params.require(:agent).permit(:name,:image,:role,:description,:skill1_name,:skill1_detail,:skill2_name,:skill2_detail,:skill3_name,:skill3_detail,:skill4_name,:skill4_detail)
  end
  
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
  
end
