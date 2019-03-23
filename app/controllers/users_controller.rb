class UsersController < ApplicationController
  include Common
  def show
    @user = User.find_by(id: params[:id]) #追記
    if @user.active_site == "youtube"
      @channel_member = calc_youtube(@user.active_url)
    else
      @channel_member = calc_Twitch(@user.active_url)
    end
  end
end