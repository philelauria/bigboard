class Role < ActiveRecord::Base
  validates :name, presence: { message: "Please specify a name"}
  belongs_to :board
end
