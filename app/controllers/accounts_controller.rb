class AccountsController < ApplicationController

  def index
  end

  def new
    @accounts = @auth.family.accounts
  end

  def create
    account = Account.new(params[:new_account])
    if account.save
      family = @auth.family
      family.accounts << account
      redirect_to overview_path
    else
      redirect_to accounts_new_path
    end
  end

  def edit
  end

  def update
  end

  def start
    @new_user = User.where(:id => session[:new_user_id]).first
  end

  def start_create
    @new_user = User.where(:id => session[:new_user_id]).first
    spending = params[:new_spending]
    spending[:family_id] = @auth.family.id
    spending[:child_id] = @new_user.id
    spending[:name] = "Spending"
    spending = Account.new(spending)
    savings = params[:new_savings]
    savings[:family_id] = @auth.family.id
    savings[:child_id] = @new_user.id
    savings[:name] = "Savings"
    savings = Account.new(savings)
    charitable = params[:new_charitable]
    charitable[:family_id] = @auth.family.id
    charitable[:child_id] = @new_user.id
    charitable[:name] = "Charitable"
    charitable = Account.new(charitable)
    if spending.save && savings.save && charitable.save
      session[:spending_acct] = spending.id
      session[:savings_acct] = savings.id
      session[:charitable_acct] = charitable.id
      redirect_to allowances_start_path
    else
      redirect_to accounts_start_path
    end
  end

end