class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(params[:new_user])
    if user.save
      family = @auth.family
      family.members << user
    end

    if user.is_parent == 't'
      redirect_to family_path
    else
      session[:new_user_id] = user.id
      redirect_to accounts_start_path
    end

  end

  def edit
  end

  def show
    @parents = @auth.family.members.where(:is_parent => 'true') if @auth.family != nil
    @children = @auth.family.members.where(:is_parent => 'false') if @auth.family != nil

    if params[:id]
      @profile = User.find(params[:id])
    else
      @profile = @auth
    end
  end

  def update
    if @auth.update_attributes(params[:user])
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
  def ensure_logged_in
    redirect_to root_path if @auth.nil?
  end

end