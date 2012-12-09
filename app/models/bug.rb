class Bug < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :state, :created_at, :updated_at
  belongs_to :project
end
