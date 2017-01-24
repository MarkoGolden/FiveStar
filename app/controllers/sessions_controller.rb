class SessionsController < ApplicationController
  def new
    if current_user.present?
      redirect_to orders_path, notice: 'You are already logged in'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to orders_path, notice: "Logged in"
    else
      flash[:error] = "Email or password is invalid"
      render "new"
    end
  end
  def forgot_password
  end
  
  def reset_password
    email = params[:user][:email]
    user = User.where(email: email).take
    if user.present?
      user.password = "ChangeMe&7"
      user.save
      redirect_to forgot_password_path, notice: "Further instructions have been sent to your e-mail address."
      url = edit_user_path(user)
      Usermailer.password_reset_email(user, url).deliver
    else
      redirect_to forgot_password_path, notice: "Entered email is not found in our records"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
