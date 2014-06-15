class UserSessionsController < ApplicationController
  skip_before_filter :require_login
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:products, notice: 'Logged in successful')
    else
      flash.now.alert = "Email or password was invalid." 
    #render 'new'
    redirect_to( :products, alert: "Email or password was invalid.")
    end
  end

  def destroy
    logout
    redirect_to(:products, notice: 'Logged out!')
  end
end
