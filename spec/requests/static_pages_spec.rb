require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App"}

  subject { page }
  
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', :text => 'Sample App') }
    
    it { should have_selector('title', text: full_title('')) }

    it { should_not have_selector('title', :text => '| Home') }
  end

  describe 'Help page' do
    before { visit help_path }

    it { should have_selector('h1', :text => 'Help') }

    it { should have_selector('title',text: full_title('Help')) }
    
  end

  describe 'About page' do
    before { visit about_path }

    it { should have_selector('h1', :text => 'About') }

    it { should have_selector('title', text: full_title('About')) }
    
  end

  # Left this test in the longer form to serve as an example
  describe "Contact page" do
    before { visit contact_path }

    it "should have the h1 'Contact'" do
      page.should have_selector('h1', :text => 'Contact')
    end
    it "should have the title 'Contact'" do
      page.should have_selector('title',
        :text => "#{base_title} | Contact")
    end
  end

end
