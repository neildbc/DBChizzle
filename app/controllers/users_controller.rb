class UsersController < ApplicationController
  def index
    @users = User.by_karma.limit(50)
  end

  def page
    @users = User.page(params[:page].to_i)
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end
    render :index
  end
end
