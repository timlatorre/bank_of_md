# == Schema Information
#
# Table name: percentages
#
#  id           :integer          not null, primary key
#  allowance_id :integer
#  account_id   :integer
#  percentage   :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Percentage < ActiveRecord::Base
  belongs_to :allowance
end
