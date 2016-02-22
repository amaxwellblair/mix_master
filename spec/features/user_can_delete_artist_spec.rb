require 'rails_helper'

RSpec.feature "User can delete artist" do
  scenario "they delete artist and no longer see artist in index" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist.id)

    click_on "Delete"

    expect(current_path).to eq("/artists")

    expect(page).not_to have_content "Bob Marley"
  end
end
