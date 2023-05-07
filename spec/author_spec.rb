require 'spec_helper'

describe Author do
    let(:author) {Author.new("Adarsh", "Pathak")}
    let(:item) {Item.new("2000/10/10")}
    it "Author instance can be created" do
        expect(author).to be_instance_of(Author)
    end

    it "Author should return first and last name" do
        name = "#{author.first_name.upcase} #{author.last_name.upcase}"
        expect(name).to eq("ADARSH PATHAK")
    end

    it "Author should have association with item" do
        author.add_item(item)
        expect(item.author).to be(author.id)
        expect(item.id).to be(author.items[0])
    end
end