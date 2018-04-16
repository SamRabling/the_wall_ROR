require 'rails_helper'
feature "user submits new comment" do
  before(:each) do
    visit the_wall_new_path
    fill_in "user[username]", with: "FryDelivers"
    click_button "Log In"
  end
  scenario " and it's successfully created" do
    fill_in "comment[comment]", with: "this is my new comment wiiiiii"
    click_button "Post a Comment"
    expect(page).to have_content "this is my new comment wiiiiii"
    expect(current_path).to eq(messages_path)
  end
  scenario "but comment field is empty" do
    click_button "Post a Comment"
    expect(page).to have_content "You need to write a comment!"
    expect(current_path).to eq(messages_path)
  end
  scenario "and the comment is <= 10 characters" do
    fill_in "comment[comment]", with: "You need to write a longer comment!"
    click_button "Post a Message"
    expect(page).to have_content "You need to write a longer comment!"
    expect(current_path).to eq(messages_path)
  end
end