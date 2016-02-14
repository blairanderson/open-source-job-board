require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :user => nil,
      :title => "MyString",
      :location => "MyString",
      :job_type => 1,
      :description => "MyText",
      :company_name => "MyString",
      :company_url => "MyString",
      :company_logo => "MyString",
      :how_to_apply => 1,
      :how_to_apply_address => "MyString",
      :contact_email => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "input#post_location[name=?]", "post[location]"

      assert_select "input#post_job_type[name=?]", "post[job_type]"

      assert_select "textarea#post_description[name=?]", "post[description]"

      assert_select "input#post_company_name[name=?]", "post[company_name]"

      assert_select "input#post_company_url[name=?]", "post[company_url]"

      assert_select "input#post_company_logo[name=?]", "post[company_logo]"

      assert_select "input#post_how_to_apply[name=?]", "post[how_to_apply]"

      assert_select "input#post_how_to_apply_address[name=?]", "post[how_to_apply_address]"

      assert_select "input#post_contact_email[name=?]", "post[contact_email]"
    end
  end
end
