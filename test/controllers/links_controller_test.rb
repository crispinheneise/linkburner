# frozen_string_literal: true

require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = links(:one)
  end

  test 'should get index' do
    assert_raise 'ActionController::RoutingError' do
      get links_url
    end
  end

  test 'should get new' do
    get new_link_url
    assert_response :success
  end

  test 'should create link' do
    assert_difference('Link.count') do
      post links_url, params: { link: { content: @link.content } }
    end

    assert_no_difference('Link.count') do
      assert_redirected_to link_url(assigns[:link])
    end
  end

  test 'should not destroy immediatley after create' do
    post links_url, params: { link: { content: @link.content } }
    get link_url(@link)
    assert_response :success
  end

  test 'should show link' do
    get link_url(@link)
    assert_response :success
  end

  test 'should delete link after show' do
    assert_difference 'Link.count', -1 do
      get link_url(@link)
      assert_response :success
    end

    assert_raise 'ActionController::RoutingError' do
      get link_url(@link)
    end
  end

  test 'should get edit' do
    assert_raise 'ActionController::RoutingError' do
      get edit_link_url(@link)
    end
  end

  test 'should update link' do
    assert_raise 'ActionController::RoutingError' do
      patch link_url(@link), params: { link: { content: @link.content } }
    end
  end

  test 'should destroy link' do
    assert_raise 'ActionController::RoutingError' do
      delete link_url(@link)
    end
  end
end
