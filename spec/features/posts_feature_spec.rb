require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'create posts' do
    scenario 'uploads a picture' do
      create_post
      expect(page).to have_content 'PIC'
      expect(current_path).to eq posts_path
    end

    # scenario 'prompts user to add a picture' do
    # end
  end

  context 'viewing a post' do
    let!(:pic){ Post.create(title:'PIC') }
    scenario 'user can view a post' do
      visit posts_path
      click_link 'PIC'
      expect(page).to have_content 'PIC'
      expect(current_path).to eq "/posts/#{pic.id}"
      create_post
    end

    # scenario 'post has a description' do
    # end

    # scenario 'users can add comments' do
    # end
  end
end
