# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  child_id   :integer
#  family_id  :integer
#  name       :string(255)
#  balance    :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :name, :child_id, :family_id, :category, :balance

  belongs_to :child, :class_name => 'User'
  belongs_to :family
  has_many :transactions
end
