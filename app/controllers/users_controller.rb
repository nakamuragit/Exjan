class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id]) #追記
    
  end
end