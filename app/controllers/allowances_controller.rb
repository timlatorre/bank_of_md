class AllowancesController < ApplicationController

  def index
  end

  def start
   @new_user = User.where(:id => session[:new_user_id]).first
  end

  def start_create
   @new_user = User.where(:id => session[:new_user_id]).first
   allowance = params[:new_allowance]
   allowance[:name] = "Main"
   allowance[:family_id] = @auth.family.id
   allowance[:child_id] = @new_user.id
   allowance = Allowance.create(allowance)

   spend_percentage = params[:spending]
   percentage = spend_percentage[:percentage].to_f
   spend_percentage[:percentage] = percentage / 100
   spend_percentage[:account_id] = session[:spending_acct]
   spend_percentage[:allowance_id] = allowance.id
   spend_percentage = Percentage.new(spend_percentage)

   sav_percentage = params[:savings]
   percentage = sav_percentage[:percentage].to_f
   sav_percentage[:percentage] = percentage / 100
   sav_percentage[:account_id] = session[:savings_acct]
   sav_percentage[:allowance_id] = allowance.id
   sav_percentage = Percentage.new(sav_percentage)

   char_percentage = params[:charitable]
   percentage = char_percentage[:percentage].to_f
   char_percentage[:percentage] = percentage / 100
   char_percentage[:account_id] = session[:charitable_acct]
   char_percentage[:allowance_id] = allowance.id
   char_percentage = Percentage.new(char_percentage)
     if spend_percentage.save && sav_percentage.save && char_percentage.save
      redirect_to overview_path
    else
      redirect_to allowances_start_path
    end
  end

end