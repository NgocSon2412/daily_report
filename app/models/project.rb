class Project < ActiveRecord::Base

	validates :project_name, presence: true,uniqueness: true
	
	validates :plan_time, presence: true

end
