require_relative './leaf'

class Branch
  include Mongoid::Document
  has_and_belongs_to_many :parents, class_name: "Branch", inverse_of: :children
  has_and_belongs_to_many :children, class_name: "Branch", inverse_of: :parents
  has_many :leafs
  field :name, type: String
  field :path, type: String
  field :timestamp, type: Time
end