require 'rails_helper'

describe Project do
  context 'No projects available' do
    it 'displays no projects' do
      visit '/projects'
      expect(current_path).to eq '/projects'
      expect(page).to have_content('No projects added yet.')
    end
  end
end

describe 'Adding a project:' do
  context 'It is a valid project' do
    it 'successfully adds a project' do
      visit '/projects'
      click_link 'Add a project'
      fill_in 'Title', with: 'Test project'
      fill_in 'Link', with: 'http://www.testproject.com'
      fill_in 'Description', with: 'This is a sample project.'
      click_button 'Create Project'

      expect(current_path).to eq('/projects')
      expect(page).to have_content('Test project')
      expect(page).to have_content('Project successfully created')
    end
  end
end
