require 'spec_helper'

describe "translates/edit" do
  before(:each) do
    @translate = assign(:translate, stub_model(Translate))
  end

  it "renders the edit translate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", translate_path(@translate), "post" do
    end
  end
end
