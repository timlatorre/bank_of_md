# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Family < ActiveRecord::Base
  has_many :members, :class_name => 'User', :foreign_key => 'family_id'
  has_many :chores
  has_many :accounts
  has_many :transactions
end