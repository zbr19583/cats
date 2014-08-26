# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  #starts out PENDING?
  validates :status, presence: true, inclusion: { in: %w(APPROVED DENIED), 
    message: "%{status} is not a valid status " }
  
    belongs_to :cat
    
    after_initialize :set_status
    
    def set_status
      self.status ||= "PENDING"
    end

    #associations?, cat requests for the same cat cant overlap in time
    def overlapping_requests
      if self.id
        cat.rental_requests.where('rental_requests.id != ?', self.id)
      else
        cat.rental_requests
      end
    end

    # def overlapping_approved_requests
    #
    # end
end
