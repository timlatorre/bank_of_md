class ChoresController < ApplicationController

  def index
    @chores = @auth.family.chores
    @children = @auth.family.members.where(:is_parent => 'false') if @auth.family != nil

  end

  def new

  end

  def create
    chore = Chore.new(params[:new_chore])
    if chore.save
      family = @auth.family
      family.chores << chore
      parent = @auth
      parent.chores_assigned << chore
      redirect_to chores_path
    else
      redirect_to chores_new_path
    end
  end

  def edit
  end

end

