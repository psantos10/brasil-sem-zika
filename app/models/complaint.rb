class Complaint < ActiveRecord::Base
  validates :address, :cep, :state, :city, presence: true
  attachment :picture

  belongs_to :state
  belongs_to :city
end
