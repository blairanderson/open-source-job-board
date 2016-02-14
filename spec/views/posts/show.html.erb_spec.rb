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
      :company_url => "Company Url",
      :company_logo => "Company Logo",
      :how_to_apply => 2,
      :how_to_apply_address => "How To Apply Address",
      :contact_email => "Contact Email"
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
    expect(rendered).to match(/Company Url/)
    expect(rendered).to match(/Company Logo/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/How To Apply Address/)
    expect(rendered).to match(/Contact Email/)
  end
end
