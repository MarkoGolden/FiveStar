class UsersController < ApplicationController
  def index
    @users = (policy_scope(User)).order("id desc").page params[:page]
    @users_csv = (policy_scope(User)).order("id desc")
    authorize @users, :index?

    respond_to do |format|
      format.html
      format.csv { send_data @users_csv.as_csv, :filename => 'organizations.csv' }
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user, :show?
  end

  def new
    @user = User.new
    authorize @user, :new?
  end


  def create
    @user = User.new(user_params)
    @roles = User.roles
    if @user.save
      redirect_to @user, notice: "User Created"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = User.roles
    authorize @user, :edit?
  end

  def update
    @user = User.find(params[:id])
    @roles = User.roles
        if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    if @user.update(user_params)
      redirect_to @user, notice: "User updated"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "User deleted"
  end

  def role_filter
    if params[:filter].present?
      role = User.roles[params[:filter][:role]]
      @users = User.where(role: role).page params[:page]
    end
    render 'index'
  end

  private
  def user_params
    params.require(:user).permit(:owner_id, :fname, :lname, :email, :password, :password_confirmation, :mobile, :address, :id_pp, :sex, :disabled, :race, :agreed, :phone, :fax, :starts_at, :ends_at, :status, :role, :photo)
  end


end
