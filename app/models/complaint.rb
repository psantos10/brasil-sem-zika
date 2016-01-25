class Complaint < ActiveRecord::Base
  validates :address, :cep, :state, :city, presence: true

  belongs_to :state
  belongs_to :city
end
