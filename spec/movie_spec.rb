require 'spec_helper'

describe Movie do
  let(:movie) { Movie.new('2000/10/22', silet: false) }

  it 'should be instance of Movie' do
    expect(movie).to be_instance_of(Movie)
  end

      it "Movie should return silet false" do
        expect(movie.silet).to be_falsy
    end

    it "Movie should have inheritance with item" do
        expect(movie.publish_date).to eq("2000/10/22")
    end

    it "Movie can be archived since it have cover state bad" do
        expect(movie.move_to_archive).to be_truthy
    end
end
