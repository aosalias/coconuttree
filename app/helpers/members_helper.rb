module MembersHelper
  def crew_nav(position)
    Member.send(position).map do |member|
      link_to member.name, '#' + member.first_name
    end.join(' | ')
  end
end
