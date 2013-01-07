class Survey < ActiveRecord::Base
  attr_accessible :description, :enabled, :name, :project_id, :created_at, :updated_at, :id
  belongs_to :project
  has_many :options, :dependent => :destroy

  def as_json(options={})
  	{ :description => self.description,
  	  :name => self.name,
  	  :options => self.options,
  	  :id => self.id,
  	  :created_at => self.created_at.strftime('%F') }
  end
end
