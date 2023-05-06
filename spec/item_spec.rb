require 'spec_helper'

describe Item do
  let(:item) { Item.new('2001-12-28') }
  let(:item2) { Item.new('2022-12-28') }
  it 'Item class should exist' do
    expect(item).to be_an_instance_of(Item)
  end

  it 'move to archive should be truthy' do
    item.move_to_archive
    expect(item.archived).to be_truthy
  end

  it 'move to archive should be falsy as publish year 2022' do
    item2.move_to_archive
    expect(item2.archived).to be_falsy
  end
end
