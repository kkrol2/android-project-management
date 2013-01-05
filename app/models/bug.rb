class Bug < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :state, :created_at, :updated_at
  belongs_to :project


  def as_json(options={})
    { :description => self.description,
      :name => self.name,
      :state => stateDesc(),
      :updated_at => self.updated_at.strftime('%F') }
  end

  def stateDesc

  	if state == 0
  		return 'Confirmed'
  	end

  	if state == 1
  		return "Unconfirmed"
  	end

  	if state == 2
  		return "Resolved"
  	end
  	
  end
end
