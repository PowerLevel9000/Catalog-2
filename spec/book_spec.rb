require 'spec_helper'

describe Book do
  let(:book) { Book.new('Adarsh', 'bad', '2000/10/22') }

  it 'should be instance of book' do
    expect(book).to be_instance_of(Book)
  end
end
