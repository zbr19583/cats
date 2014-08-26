# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  age         :integer          not null
#  color       :string(255)      not null
#  name        :string(255)      not null
#  sex         :string(255)      not null
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#  birth_date  :date
#

class Cat < ActiveRecord::Base
  validates :age, presence: true, numericality: true
  validates :color, presence: true, inclusion: { in: %w(black white brown grey), 
    message: "%{color} is not a valid color" }
  validates :sex, presence: true, inclusion: { in: %w(M F),
    message: "%{sex} is not a valid sex" }
    
    has_many :cat_rental_requests, dependent: :destroy
end
