require 'spec_helper'

describe Label do
  let(:label) { Label.new('Romantic', 'pink') }
  let(:item) { Item.new('2000/10/10') }
  it 'Label instance can be created' do
    expect(label).to be_instance_of(Label)
  end

  it 'Label should return name' do
    la = "#{label.title}, #{label.color}"
    expect(la).to eq('Romantic, pink')
  end

  it 'Label should have association with item' do
    label.add_item(item)
    expect(item.label).to be(label.id)
    expect(item.id).to be(label.items[0])
  end
end
