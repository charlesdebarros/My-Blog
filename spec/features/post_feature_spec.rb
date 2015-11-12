require 'rails_helper'

describe Post do
  
  context 'No posts available' do
    it 'displays no posts' do
      visit '/posts'
      expect(current_path).to eq '/posts'
      expect(page).to have_content('No posts added yet.')
    end
  end

  describe 'Adding a post:' do
    context 'It is a valid post' do
      it 'successfully adds a post' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Title', with: 'Test post'
        fill_in 'Content', with: 'This is a sample post.'
        click_button 'Create Post'

        expect(current_path).to eq('/posts')
        expect(page).to have_content('This is a sample post.')
        expect(page).to have_content('Post successfully created')
      end
    end

    context 'It is not a valid post' do
      it 'fails to add a post' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Title', with: ''
        fill_in 'Content', with: ''
        click_button 'Create Post'

        expect(current_path).to eq('/posts')
        expect(page).not_to have_content('Test Post')
        expect(page).to have_content('Unable to add post')
      end

      it 'displays errors if bad data is giving' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Title', with: ''
        fill_in 'Content', with: ''
        click_button 'Create Post'

        expect(current_path).to eq('/posts')
        expect(page).to have_content('errors')
      end
    end
  end
end
