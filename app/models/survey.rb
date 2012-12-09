class Survey < ActiveRecord::Base
  attr_accessible :description, :enabled, :name, :project_id, :created_at, :updated_at
  belongs_to :project
  has_many :options, :dependent => :destroy
end
