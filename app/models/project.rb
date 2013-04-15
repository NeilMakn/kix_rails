class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :launch_date, :name
end
