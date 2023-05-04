require 'spec_helper.rb'

describe Book do
    let(:book) { Book.new('Adarsh', 'bad') }

    it "should be instance of book" do
        expect(book).to be_instance_of(Book)
    end
end