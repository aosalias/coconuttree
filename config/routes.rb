ActionController::Routing::Routes.draw do |map|
  map.resources :sites


  map.resources :members, :collection => { :crew => :get, :grads => :get }

  map.resources :courses, :collection => { :rec => :get, :spec => :get, :pro => :get, :tec => :get }

  map.root :controller => 'diving', :action => 'shop'

  map.shop 'shop', :controller => 'diving', :action => 'shop'
  map.center 'center', :controller => 'diving', :action => 'center'
  map.offer 'offer', :controller => 'diving', :action => 'offer'
  map.packages 'packages', :controller => 'diving', :action => 'packages'
  map.schedule 'schedule', :controller => 'diving', :action => 'schedule'
  map.boats 'boats', :controller => 'diving', :action => 'boats'
  map.why 'why', :controller => 'diving', :action => 'why'
  map.elearning 'elearning', :controller => 'diving', :action => 'elearning'

end
