require 'spec_helper'

describe Genre do
    let(:genre) {Genre.new("Adarsh Pathak")}
    let(:item) {Item.new("2000/10/10")}
    it "Genre instance can be created" do
        expect(genre).to be_instance_of(Genre)
    end

    it "Genre should return name" do
        name = "#{genre.name.upcase}"
        expect(name).to eq("ADARSH PATHAK")
    end

    it "Genre should have association with item" do
        genre.add_item(item)
        expect(item.genre).to be(genre.id)
        expect(item.id).to be(genre.items[0])
    end
end