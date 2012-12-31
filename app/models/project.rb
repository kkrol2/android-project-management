class Project < ActiveRecord::Base
  attr_accessible :description, :header_text, :link_to_app, :name, :created_at, :updated_at
  has_many :images, :dependent => :destroy
  has_many :bugs, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :marks, :dependent => :destroy
  has_many :surveys, :dependent => :destroy
end
