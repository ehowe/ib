require 'spec_helper'

describe "translates/show" do
  before(:each) do
    @translate = assign(:translate, stub_model(Translate))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
