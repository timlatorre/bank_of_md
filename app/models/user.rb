# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  first_name      :string(255)
#  email           :string(255)
#  text_number     :string(255)
#  is_parent       :boolean
#  family_id       :integer
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  belongs_to :family
  has_many :transactions
  has_many :accounts, :class_name => 'Account', :foreign_key => 'child_id'
  has_many :chores_assigned, :class_name => 'Chore', :foreign_key => 'parent_id'
  has_many :chores, :class_name => 'Chore', :foreign_key => 'child_id'
  has_many :transactions_created, :class_name => 'Transaction', :foreign_key => 'parent_id'
  has_many :transactions, :class_name => 'Transaction', :foreign_key => 'child_id'
end
