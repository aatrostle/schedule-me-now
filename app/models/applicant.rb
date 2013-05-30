class Applicant < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, :presence => true

  has_many :interviews
  # has_one :interview
  has_many :users, :through => :interviews
end
