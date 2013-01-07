class Option < ActiveRecord::Base
  attr_accessible :name, :survey_id, :votes_number, :id
  belongs_to :survey
end
