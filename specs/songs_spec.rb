require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestSongs < Minitest::Test
  def setup
    @song1 = Song.new("Bohemian Rapsody")
    @song2 = Song.new("Your Song")
    @song3 = Song.new("Angels")
    @song4 = Song.new("Don't Go Breaking My Heart")
    @song5 = Song.new("Baby Shark")
    @song6 = Song.new("No Diggity")

    @all_songs = [@song1, @song2, @song3, @song4, @song5, @song6]
  end
end
