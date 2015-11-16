require 'rails_helper'

describe Project do
  context 'No projects available' do
    it 'displays no projects' do
      visit '/projects'
      expect(current_path).to eq '/projects'
      expect(page).to have_content('No projects added yet.')
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
    context 'It is not a valid project' do
      it 'fails to add a project' do
        visit '/projects'
        click_link 'Add a project'
        fill_in 'Title', with: ''
        fill_in 'Link', with: ''
        fill_in 'Description', with: ''
        click_button 'Create Project'

        expect(current_path).to eq('/projects')
        expect(page).not_to have_content('Test Project')
        expect(page).to have_content('Unable to create project')
      end
      it 'displays errors if bad data is giving' do
        visit '/projects'
        click_link 'Add a project'
        fill_in 'Title', with: ''
        fill_in 'Description', with: ''
        click_button 'Create Project'

        expect(current_path).to eq('/projects')
        expect(page).to have_content('errors')
      end
    end
    context 'Displaying a project' do
      before do
        Project.create(title: 'Test project', link: 'http://www.testpost.com', description: 'This is a sample project.')
      end

      it 'displays a project' do
        visit '/projects'
        click_link 'Test project'

        expect(page).to have_content('Test project')
        expect(page).to have_content('This is a sample project.')
      end
    end
  end
end







