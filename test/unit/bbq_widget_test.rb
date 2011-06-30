require 'test_helper'
require 'bbq/test_user'
require 'bbq/test'
require 'bbq-widget'

class BbqWidgetTest < Test::Unit::TestCase

  def test_responsivnes
    w = Bbq::Widget::WithinCssId.new(Bbq::TestUser.new, nil)
    assert w.respond_to?(:see?)
    assert w.respond_to?(:see!)
    assert w.respond_to?(:has_content?)
    assert w.respond_to?(:click_button)
    assert w.respond_to?(:save_page)
  end

  def test_explicit_user_eyes
    user = Bbq::TestUser.new
    user.visit "/"

    l1 = Bbq::Widget::WithinCssId.new(user, nil)
    def l1.css_id; ".second" end

    l2 = Bbq::Widget::WithinCssId.new(l1, nil)
    def l2.css_id; ".second" end

    l3 = Bbq::Widget::WithinCssId.new(l2, nil)
    def l3.css_id; ".second" end

    assert user.has_css?("#ul1li1")
    assert user.see?('ul1li1')

    assert ! l1.has_css?("#ul1li1")
    assert ! l1.see?('ul1li1')
    assert_raise(FAILED_ASSERTION) { l1.see!('ul1li1') }
    assert ! l1.within(:css, '.second'){ l1.has_content?("ul2li1") }

    assert l1.within(:css, '.first'){ l1.has_content?("ul2li1") }
    assert l1.has_css?("#ul2li1")
    assert l1.see?('ul2li1')

    assert ! l2.has_css?("#ul2li1")
    assert ! l2.see?('ul2li1')
    assert_raise(FAILED_ASSERTION) { l2.see!('ul2li1') }
    assert ! l2.within(:css, '.second'){ l2.has_content?("ul3li1") }

    assert l2.within(:css, '.first'){ l2.has_content?("ul3li1") }
    assert l2.has_css?("#ul3li1")
    assert l2.see?('ul3li1')
  end

end
