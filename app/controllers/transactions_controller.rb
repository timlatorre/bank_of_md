class TransactionsController < ApplicationController

  def index
  end

  def new
    @accounts = @auth.family.accounts
  end

  def create
    new_transaction = params[:new_transaction]
    new_transaction[:family_id] = @auth.family.id
    new_transaction[:parent_id] = @auth.id
    account = @auth.family.accounts.where(:id => new_transaction[:account_id])
    new_transaction[:strt_balance] = account.first.balance
      if new_transaction[:is_credit] == 'true'
        end_balance = new_transaction[:strt_balance] + new_transaction[:amt_change].to_d
      else new_transaction[:is_credit] == 'false'
        end_balance =  new_transaction[:strt_balance] - new_transaction[:amt_change].to_d
      end
    new_transaction[:end_balance] = end_balance
    transaction = Transaction.new(params[:new_transaction])
    if transaction.save
      account = Account.where(:id => transaction[:account_id]).first
      new_balance = transaction[:end_balance]
      account.update_attributes(:balance => new_balance)
    redirect_to overview_path
    else
      redirect_to transactions_new_path
    end
  end

  def edit
  end

  def update
  end

  def account
    @account = Account.find(params[:account_id].to_i)
    session[:account_id] = @account.id
    @is_credit = params[:is_credit]
    session[:is_credit] = @is_credit
  end

  def account_create
    @account = Account.find(session[:account_id])
    new_transaction = params[:new_transaction]
    new_transaction[:family_id] = @auth.family.id
    new_transaction[:parent_id] = @auth.id
    new_transaction[:is_credit] = session[:is_credit]
    new_transaction[:account_id] = session[:account_id]
    account = @auth.family.accounts.where(:id => new_transaction[:account_id])
    new_transaction[:strt_balance] = account.first.balance
      if new_transaction[:is_credit] == 'true'
        end_balance = new_transaction[:strt_balance] + new_transaction[:amt_change].to_d
      else new_transaction[:is_credit] == 'false'
        end_balance =  new_transaction[:strt_balance] - new_transaction[:amt_change].to_d
      end
    new_transaction[:end_balance] = end_balance
    transaction = Transaction.new(params[:new_transaction])
    if transaction.save
      account = Account.where(:id => transaction[:account_id]).first
      new_balance = transaction[:end_balance]
      account.update_attributes(:balance => new_balance)
    redirect_to overview_path
    else
      redirect_to transactions_new_path
    end
  end

end