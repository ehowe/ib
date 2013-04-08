require 'spec_helper'

describe "translates/new" do
  before(:each) do
    assign(:translate, stub_model(Translate).as_new_record)
  end

  it "renders new translate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", translates_path, "post" do
    end
  end
end
