class FamilyController < ApplicationController

  def index
    @parents = @auth.family.members.where(:is_parent => 'true') if @auth.family != nil
    @children = @auth.family.members.where(:is_parent => 'false') if @auth.family != nil
  end

  def exists
    if @auth.family.nil?
      redirect_to family_new_path
    else
      redirect_to profile_new_path
    end
  end

  def new
  end

  def create
    family = Family.create(:name => params[:name])
    if family.save
      family.members << @auth
      redirect_to profile_new_path
    else
      redirect_to family_new_path
    end
  end

end