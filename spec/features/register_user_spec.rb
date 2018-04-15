require 'rails_helper'
feature "New user " do
    scenario "successfully creates a new user account" do
        visit the_wall_new_path
        fill_in "user[username]", with: "FryDelivers"
        click_button "Log In"
        expect(page). to have_content "Hello FryDelivers!"
        expect(current_path).to eq(messages_path)
    end

    scenario "leaves username empty" do
        visit the_wall_new_path
        click_button "Log In"
        expect(page).to have_content "username cannot be blank"
        expect(current_path).to eq(the_wall_new_path)
    end

    scenario "submits a username <= 5 characters" do
        visit the_wall_new_path
        fill_in "user[username]", with: "too_short"
        click_button "Log In"
        expect(page). to have_content "username cannot have a username shorter than 6 characters" 
        expect(current_path).to eq(the_wall_new_path)
    end
end
