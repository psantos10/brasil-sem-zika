class City < ActiveRecord::Base
  has_many :complaints
  belongs_to :state
end
