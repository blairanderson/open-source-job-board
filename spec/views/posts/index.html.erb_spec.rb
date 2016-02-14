require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :user => nil,
        :title => "Title",
        :location => "Location",
        :job_type => 1,
        :description => "MyText",
        :company_name => "Company Name",
        :company_url => "Company Url",
        :company_logo => "Company Logo",
        :how_to_apply => 2,
        :how_to_apply_address => "How To Apply Address",
        :contact_email => "Contact Email"
      ),
      Post.create!(
        :user => nil,
        :title => "Title",
        :location => "Location",
        :job_type => 1,
        :description => "MyText",
        :company_name => "Company Name",
        :company_url => "Company Url",
        :company_logo => "Company Logo",
        :how_to_apply => 2,
        :how_to_apply_address => "How To Apply Address",
        :contact_email => "Contact Email"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Url".to_s, :count => 2
    assert_select "tr>td", :text => "Company Logo".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "How To Apply Address".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
  end
end
