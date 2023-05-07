require 'spec_helper'

describe Source do
    let(:source) {Source.new("Romantic")}
    let(:item) {Item.new("2000/10/10")}
    it "Source instance can be created" do
        expect(source).to be_instance_of(Source)
    end

    it "Source should return Title" do
        la = "#{source.name}"
        expect(la).to eq("Romantic")
    end

    it "Source should have association with item" do
        source.add_item(item)
        expect(item.source).to be(source.id)
        expect(item.id).to be(source.items[0])
    end
end