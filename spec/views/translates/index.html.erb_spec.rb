require 'spec_helper'

describe "translates/index" do
  before(:each) do
    assign(:translates, [
      stub_model(Translate),
      stub_model(Translate)
    ])
  end

  it "renders a list of translates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
