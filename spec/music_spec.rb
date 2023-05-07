require 'spec_helper'

describe Music do
  let(:music) { Music.new('2000/10/22', on_spotify: false) }

  it 'should be instance of Music' do
    expect(music).to be_instance_of(Music)
  end

      it "Music should return on spotify false" do
        expect(music.on_spotify).to be_falsy
    end

    it "Music should have inheritance with item" do
        expect(music.publish_date).to eq("2000/10/22")
    end

    it "Music can't be archived since it is not on spotify" do
        music.move_to_archive
        expect(music.archived).to be_falsy
    end
end
