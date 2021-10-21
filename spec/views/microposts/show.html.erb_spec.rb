require 'rails_helper'

RSpec.describe "microposts/show", type: :view do
  before(:each) do
    @micropost = assign(:micropost, Micropost.create!(
      content: "MyText",
      user_id: 2,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
