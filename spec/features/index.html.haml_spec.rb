require 'spec_helper'

describe "static/index.html.haml" do
  it "Has a header" do
    visit '/'
    page.should have_content("Wellcome to the Document Storage!")
  end
    it "has a link to sign up page" do
      visit '/'
      page.should have_link('sign up')
      page.should have_link('login')
      page.should have_link('recover lost password')
    end
end
