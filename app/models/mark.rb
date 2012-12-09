class Mark < ActiveRecord::Base
  attr_accessible :mark, :project_id, :created_at, :updated_at
  belongs_to :project
end
