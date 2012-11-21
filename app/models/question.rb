class Question < ActiveRecord::Base
  attr_accessible :content
  belongs_to :poll
  has_many :responses
end