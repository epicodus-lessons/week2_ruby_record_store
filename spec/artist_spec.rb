require('spec_helper')

describe '#Artist' do

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Joni Mitchell", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Joni Mitchell", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:name => "Joni Mitchell", :id => nil})
      artist2 = Artist.new({:name => "Joni Mitchell", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Joni Mitchell", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist.update({:name => "Joni Mitchell", :album_ids => []})
      expect(artist.name).to(eq("Joni Mitchell"))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      album2 = Album.new({:name => "Giant Steps", :id => nil})
      album2.save()
      artist.update({:album_ids => [album.id, album2.id]})
      expect(artist.albums).to(eq([album, album2]))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Joni Mitchell", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  # describe('#albums') do
  #   it("returns an artist's albums") do
  #     artist = Artist.new({:name => "John Coltrane", :id => nil})
  #     artist.save()
  #     album = Album.new({:name => "Giant Steps", :artist_id => artist.id, :id => nil})
  #     album.save()
  #     album2 = Album.new({:name => "A Love Supreme", :artist_id => artist.id, :id => nil})
  #     album2.save()
  #     expect(artist.albums).to(eq([album, album2]))
  #   end
  # end
  #
  # describe('#delete') do
  #   it("deletes all songs that belong to an artist") do
  #     artist = Artist.new({:name => "John Coltrane", :id => nil})
  #     artist.save()
  #     song = Song.new({:name => "Naima", :artist_id => artist.id, :id => nil})
  #     song.save()
  #     artist.delete()
  #     expect(Song.find(song.id)).to(eq(nil))
  #   end
  # end
end
