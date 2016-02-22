require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they can fill out an edit form which changes the artist attributes" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist.id)
    click_on "Edit"

    expect(current_path).to eq "/artists/#{artist.id}/edit"

    fill_in "artist_name", with: (artist_name + " Yeeee")
    click_on "Edit Artist"

    expect(page).to have_content "#{artist_name} Yeeee"
  end


end
