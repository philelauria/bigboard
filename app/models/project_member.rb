class ProjectMember < ActiveRecord::Base
  has_paper_trail
  validates :project_id, presence: { message: "Requires project"}
  validates :person_id, presence: { message: "Requires person"}
  belongs_to :project
  belongs_to :person
  belongs_to :role
end