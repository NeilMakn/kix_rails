class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  attr_accessible :launch_date, :name
end
