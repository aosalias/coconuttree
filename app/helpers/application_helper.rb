# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def mouse_over_image(destination)
    image_tag 'links/popout_off.gif', {:class=>"popout", :width=>"20", :height=>"20", :border=>"0",  :alt=>"", :id=>"#{destination}Img", :onmouseover=>"ShowMenu(#{destination});", :onmouseout=>"HideMenu();"}
  end

  def mouse_over_link(destination, title, menu)
    link_to title, @controller.send(destination + "_path"), :onmouseover => "ShowMenu(#{menu});", :onmouseout => "HideMenu();"
#    method = foo_path
#    logger.info 'foooooooooooooooo\n\n\n\n\n\n' + instance_variables.join(', ') + @controller.methods.join(', ')
#    <a href="http://www.coconuttreedivers.com/diving/index.php" onmouseover="ShowMenu('diving');" onmouseout="HideMenu();">Dive Packages</a>

  end
end
