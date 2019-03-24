class OrdersController < ApplicationController
  def create
    @user_id = current_user.id 
    @project_id = Project.find(params[:format]).id
    @order = Order.new(project_id: @project_id, user_id: @user_id)
    if @order.save
      redirect_to user_path(current_user)
    end
  end

  def destroy 
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to user_path(current_user)
    end
  end
end
