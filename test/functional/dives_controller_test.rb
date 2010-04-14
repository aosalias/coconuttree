require 'test_helper'

class DivesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Dives.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Dives.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Dives.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dives_url(assigns(:dives))
  end
  
  def test_edit
    get :edit, :id => Dives.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Dives.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Dives.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Dives.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Dives.first
    assert_redirected_to dives_url(assigns(:dives))
  end
  
  def test_destroy
    dives = Dives.first
    delete :destroy, :id => dives
    assert_redirected_to dives_url
    assert !Dives.exists?(dives.id)
  end
end
