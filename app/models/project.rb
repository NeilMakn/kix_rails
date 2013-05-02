class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  attr_accessible :launch_date, :name, :user_id
end
