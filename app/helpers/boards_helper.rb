module BoardsHelper

  def display_percentage num, den
    per = percentage num, den
    "#{per}% (#{num})"
  end

  def percentage num, den
    den == 0 ? 0 : 100.0*(num.to_f/den).round(1)
  end

  def version_object_link board, version
    link = ''
    name = ''
    if version.item_type == 'Project'
      item = Project.find_by_id version.item_id
      name = item.nil? ? '' : item.name
      link = link_to name, board_project_path(board, item) unless item.nil?
    elsif version.item_type == 'ProjectMember'
      item = ProjectMember.find_by_id version.item_id
      name = item.nil? || item.person.nil? ? '': item.person.name
      link = link_to name, project_member_path(item) unless item.nil?
    elsif version.item_type == 'Initiative'
      item = Initiative.find_by_id version.item_id
      name = item.nil? ? '' : item.name
      link = link_to name, board_initiative_path(board, item) unless item.nil?
    elsif version.item_type == 'Person'
      item = Person.find_by_id version.item_id
      name = item.nil? ? '' : item.name
      link = link_to name, board_person_path(board, item) unless item.nil?
    elsif version.item_type == 'Team'
      item = Team.find_by_id version.item_id
      name = item.nil? ? '' : item.name
      link = link_to name, board_team_path(board, item) unless item.nil?
    elsif version.item_type == 'Board'
      item = Board.find_by_id version.item_id
      name = item.nil? ? '' : item.name
      link = link_to name, board_team_path(board, item) unless item.nil?
    end
    link
  end

end