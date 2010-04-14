require 'test_helper'

class DivesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Dives.new.valid?
  end
end
