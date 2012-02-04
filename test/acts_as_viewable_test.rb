require 'test_helper'

class ActsAsViewableTest < ActiveSupport::TestCase
  
  fixtures :questions
  
  def test_respond_to_views_method
    @question = questions(:one)
    assert_respond_to @question, :views
  end
  
  def test_respond_to_nb_views_method
    @question = questions(:one)
    assert_respond_to @question, :nb_views
  end
  
  def test_nb_views_method
    @question = questions(:one)
    @question.view!("192.168.33.1")
    assert_equal 1, @question.nb_views
  end
  
  def test_respond_to_viewable_method
    @question = questions(:one)
    assert_respond_to @question, :viewable?
  end
  
  def test_viewable_method
    @question = questions(:one)
    assert_equal true, @question.viewable?
  end
  
  def test_respond_to_view_bang_method
    @question = questions(:one)
    assert_respond_to @question, :view!
  end
  
  def test_view_bang_method
    @question = questions(:one)
    @question.view!("192.168.33.2")
    assert_equal 1, @question.nb_views
    @question.view!("192.168.33.2")
    assert_equal 1, @question.nb_views
  end
  
  def test_most_viewed_method
  end
  
end
