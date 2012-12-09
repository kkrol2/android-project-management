class Comment < ActiveRecord::Base
  attr_accessible :content, :nick_name, :project_id, :created_at, :updated_at
  belongs_to :project
end
