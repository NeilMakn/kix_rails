class Project < ActiveRecord::Base
  after_create :create_tasks
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  attr_accessible :launch_date, :name, :user_id
end
