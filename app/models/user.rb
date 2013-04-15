class User < ActiveRecord::Base
  after_create :create_initial_project_and_tasks

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :default_project_id
  # attr_accessible :title, :body

  # associations
  has_many :projects, :dependent => :destroy
  has_many :tasks, :through => :projects

  def create_initial_project_and_tasks
    # TODO: if this failed we would need to delete the newly
    # created user entry then flash a message that says the
    # account could not be created.
    User.transaction do
      project = self.projects.create(:user_id => self.id)
      self.default_project_id = project.id

      (0..24).each do |i|
        project.tasks.new(:type_task => i)
      end
      self.save!
    end
  end
end
