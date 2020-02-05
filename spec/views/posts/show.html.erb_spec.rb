require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/https:\/\/example.com/)
  end
end
