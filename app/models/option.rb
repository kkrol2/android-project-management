class Option < ActiveRecord::Base
  attr_accessible :name, :survey_id, :votes_number
  belongs_to :survey
end
