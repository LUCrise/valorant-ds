class AgentsController < ApplicationController
  
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  
  def new
    @agent = Agent.new
  end
  
  def create
    @agent = current_user.agents.build(agent_params)

    if @agent.save
      flash[:success] = 'エージェントが正常に作成されました'
      redirect_to "/"
    else
      flash.now[:danger] = 'エージェントが作成されませんでした'
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
    
    flash[:success] = 'エージェントは正常に削除されました'
    redirect_to "/"
  end
  
    # Strong Parameter
  def agent_params
    params.require(:agent).permit(:name,:image,:role,:description,:skill1_name,:skill1_detail,:skill2_name,:skill2_detail,:skill3_name,:skill3_detail,:skill4_name,:skill4_detail)
  end
  
end
