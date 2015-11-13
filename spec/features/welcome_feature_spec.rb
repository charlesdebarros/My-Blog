require 'rails_helper'

describe 'Welcome index page' do
  it 'displays the welcome#index content' do
    visit '/welcome/index'
    expect(page).to have_selector('div.wrapper.wrapper-padding.clearfix')
    expect(page).to have_selector('div.col-2.homepage-content')
    expect(page).to have_selector('div.col-3.homepage-content')
  end
end
