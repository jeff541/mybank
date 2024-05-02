# == Schema Information
#
# Table name: dettes
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Dette < ApplicationRecord
end
