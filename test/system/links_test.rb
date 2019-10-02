# frozen_string_literal: true

require 'application_system_test_case'

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:one)
  end

  test 'creating a Link' do
    visit root_url

    fill_in 'Content', with: @link.content
    click_on 'Create Link'

    assert_text 'Link was successfully created'
  end

  test 'visiting a link' do
    visit link_url(@link)
    assert_text 'Super secret content'
  end

  test 'creating, then viewing a link' do
    Link.destroy_all
    visit root_url

    fill_in 'Content', with: 'Top secret, eyes only'
    click_on 'Create Link'

    assert_text 'Top secret, eyes only'

    visit link_url(Link.order(:created_at).first)
    assert_text 'Top secret, eyes only'
  end
end
