# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def mouse_over_image(destination)
    image_tag 'links/popout_off.gif', {:class=>"popout", :width=>"20", :height=>"20", :border=>"0",  :alt=>"", :id=>"#{destination}Img", :onmouseover=>"ShowMenu('#{destination}');", :onmouseout=>"HideMenu();"}
  end

  def course_sub_menu(type)
    Course.send(type).map do |course|
      link_to course.title, course_path(course.id), { :onmouseover => "ShowMenu('#{type}');", :onmouseout => "HideMenu();" }
    end.join(' ')
  end

end
