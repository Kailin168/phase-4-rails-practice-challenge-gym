class Client < ApplicationRecord

  has_many :memberships
  has_many :gyms, through: :memberships

  def find_total_cost
    self.memberships.sum(:charge)
    # memberships.sum(:charge) These are the same, Ruby can reference what self means
    end
 
end
