require 'rails_helper'

RSpec.describe "doctors/index", type: :view do
  before(:each) do
    assign(:doctors, [
      Doctor.create!(
        :name => "Name",
        :email => "email@example.com",
        :phone => "123"
      ),
      Doctor.create!(
        :name => "Name",
        :email => "email2@example.com",
        :phone => "32180"
      )
    ])
  end

  it "renders a list of doctors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "email@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "email2@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "123".to_s, :count => 1
    assert_select "tr>td", :text => "32180".to_s, :count => 1
  end
end
