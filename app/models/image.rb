class Image < ActiveRecord::Base
  attr_accessible :name, :path, :project_id, :created_at, :updated_at
  belongs_to :project
end
