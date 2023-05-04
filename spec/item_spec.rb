require 'spec_helper'

describe Item do
    let(:item) {Item.new("2001-12-28")}
    it "Item class should exist" do
        expect(item).to be_an_instance_of(Item)
    end
end