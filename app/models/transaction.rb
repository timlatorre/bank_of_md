# == Schema Information
#
# Table name: transactions
#
#  id           :integer          not null, primary key
#  account_id   :integer
#  parent_id    :integer
#  family_id    :integer
#  description  :string(255)
#  memo         :string(255)
#  is_credit    :boolean
#  strt_balance :decimal(, )
#  amt_change   :decimal(, )
#  end_balance  :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Transaction < ActiveRecord::Base
  belongs_to :family
  belongs_to :account
  belongs_to :parent, :class_name => 'User'
  belongs_to :child, :class_name => 'User'
end
