require 'spec_helper'

describe Book do
  let(:book) { Book.new('Adarsh', 'bad', '2000/10/22') }

  it 'should be instance of Book' do
    expect(book).to be_instance_of(Book)
  end

  it 'Book should return publisher and cover state' do
    name = "#{book.publisher}, #{book.cover_state}"
    expect(name).to eq('Adarsh, bad')
  end

  it 'Book should have inheritance with item' do
    expect(book.publish_date).to eq('2000/10/22')
  end

  it 'Book can be archived since it have cover state bad' do
    book.move_to_archive
    expect(book.archived).to be_truthy
  end
end
