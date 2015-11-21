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

    context 'When a user is logged out' do
      it 'takes the user to a the users#sign_in page' do
        visit '/projects'
        click_link 'Add a project'

        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content ('Log in')
      end
    end

    context 'When the user is logged in' do
      before do
        login_as_test_user
      end

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
    end
  end

  describe 'Working with projects' do
    before do
      Project.create(title: 'Test project', link: 'http://www.testpost.com', description: 'This is a sample project.')
      login_as_test_user
    end
    context 'Displaying a project' do
      it 'displays a project' do
        visit '/projects'
        click_link 'Test project'

        expect(page).to have_content('Test project')
        expect(page).to have_content('This is a sample project.')
      end
    end
    context 'Editing a project' do
      it 'updates the project\'s details' do
        visit '/projects/test-project'
        click_link 'Edit'
        fill_in 'Title', with: 'Old test project'
        fill_in 'Link', with: 'http://www.oldtestproject.com'
        fill_in 'Description', with: 'This is an old sample project.'
        click_button 'Update Project'

        expect(page).to have_content('Old test project')
        expect(page).to have_content('This is an old sample project.')
      end

      it 'updates the project with invalid data' do
        visit '/projects/test-project'
        click_link 'Edit'
        fill_in 'Title', with: ''
        fill_in 'Link', with: ''
        fill_in 'Description', with: ''
        click_button 'Update Project'

        expect(page).not_to have_content('Old test post')
        expect(page).to have_content('errors')
      end

      it 'displays error messages when data is invalid' do
        visit '/projects/test-project'
        click_link 'Edit'
        fill_in 'Title', with: ''
        fill_in 'Link', with: ''
        fill_in 'Description', with: ''
        click_button 'Update Project'

        expect(page).to have_content('errors')
        expect(page).to have_content('Title can\'t be blank')
        expect(page).to have_content('Link can\'t be blank')
        expect(page).to have_content('Description can\'t be blank')
      end
    end
    context 'Deleting a post' do
      it 'destroys the project record permanently' do
        visit '/projects/test-project'
        click_link 'Delete'

        expect(page).not_to have_content('Test project')
        expect(page).not_to have_content('This is a sample project.')
        expect(page).to have_content('Project successfully deleted!')
      end
    end
  end
end







