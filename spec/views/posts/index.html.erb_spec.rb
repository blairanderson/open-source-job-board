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
        :company_url => "https://example.com",
        :company_logo => "Company Logo",
        :how_to_apply => "apply_by_email",
        :how_to_apply_address => "How To Apply Address",
        :contact_email => "acme_corp@example.com"
      ),
      Post.create!(
        :user => nil,
        :title => "Title",
        :location => "Location",
        :job_type => 1,
        :description => "MyText",
        :company_name => "Company Name",
        :company_url => "https://example.com",
        :company_logo => "Company Logo",
        :how_to_apply => "apply_by_email",
        :how_to_apply_address => "How To Apply Address",
        :contact_email => "acme_corp@example.com"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "div>h2", :text => "Title".to_s, :count => 2
    assert_select "div>h4", :text => "Location".to_s, :count => 2
    assert_select "div>h3", :text => "Company Name".to_s, :count => 2
  end
end
