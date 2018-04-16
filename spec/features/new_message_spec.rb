require 'rails_helper'
feature "user submits new message" do
  before(:each) do
    visit the_wall_new_path
    fill_in "user[username]", with: "FryDelivers"
    click_button "Log In"
  end
  scenario " and it's successfully created" do
    fill_in "message[message]", with: "this is my new message wiiiiii"
    click_button "Post a Message"
    expect(page).to have_content "this is my new message wiiiiii"
    expect(current_path).to eq(messages_path)
  end
  scenario "but message field is empty" do
    click_button "Post a Message"
    expect(page).to have_content "You need to write a message!"
    expect(current_path).to eq(messages_path)
  end
  scenario "and the message is <= 10 characters" do
    fill_in "message[message]", with: "You need to write a longer message!"
    click_button "Post a Message"
    expect(page).to have_content "You need to write a longer message!"
    expect(current_path).to eq(messages_path)
  end
end