class Response < ActiveRecord::Base
  attr_accessible :content
  belongs_to :question
end