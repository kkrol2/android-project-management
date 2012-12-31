class Comment < ActiveRecord::Base
  attr_accessor :formatted_date
  attr_accessible :content, :nick_name, :project_id, :created_at, :updated_at, :formatted_date
  belongs_to :project

  def as_json(options={})
  	{ :content => self.content,
  	  :nick_name => self.nick_name,
  	  :created_at => self.created_at.strftime('%F') }
  end

end
