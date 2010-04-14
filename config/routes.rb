ActionController::Routing::Routes.draw do |map|
  map.resources :dives

  map.resources :courses

  map.root :controller => 'diving', :action => 'shop'
  
  map.shop 'shop', :controller => 'diving', :action => 'shop'
  map.center 'center', :controller => 'diving', :action => 'center'
  map.diving 'dives', :controller => 'diving', :action => 'dives'
  map.offer 'offer', :controller => 'diving', :action => 'offer'
  map.packages 'packages', :controller => 'diving', :action => 'packages'
  map.schedule 'schedule', :controller => 'diving', :action => 'schedule'
  map.boats 'boats', :controller => 'diving', :action => 'boats'
  map.why 'why', :controller => 'diving', :action => 'why'
  map.elearning 'elearning', :controller => 'diving', :action => 'elearning'

end
