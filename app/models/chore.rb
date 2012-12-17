# == Schema Information
#
# Table name: chores
#
#  id           :integer          not null, primary key
#  parent_id    :integer
#  child_id     :integer
#  family_id    :integer
#  name         :string(255)
#  description  :string(255)
#  is_allowance :boolean
#  amount       :decimal(, )
#  is_approved  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Chore < ActiveRecord::Base
  belongs_to :parent, :class_name => 'User'
  belongs_to :child, :class_name => 'User'
  belongs_to :family
end
