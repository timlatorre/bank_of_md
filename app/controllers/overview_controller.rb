class OverviewController < ApplicationController

  def index
    @accounts = @auth.family.accounts if @auth.family.accounts != nil
    @children = @auth.family.members.where(:is_parent => 'false') if @auth.family != nil
    @transactions = @auth.family.transactions
  end

end