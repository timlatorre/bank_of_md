# == Schema Information
#
# Table name: allowances
#
#  id         :integer          not null, primary key
#  child_id   :integer
#  family_id  :integer
#  name       :string(255)
#  payday     :string(255)
#  frequency  :string(255)
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Allowance < ActiveRecord::Base
  has_many :percentages
end
