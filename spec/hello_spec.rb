require 'spec_helper'

describe Hello do
  let(:hello) {Hello.new}
  it "test the testing" do
    expect(hello.hello("Alice Adarsh Team")).to eq("hello Alice Adarsh Team")
  end
end