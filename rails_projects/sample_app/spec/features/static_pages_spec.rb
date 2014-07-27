require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Ruby on Rails Tutorial sample | Home')
    end
  end

     describe "Help page" do
    
      it "should have content Help" do
        visit '/static_pages/help'
        page.should have_content('Help')
      end
    end

     describe "About Help" do
  
       it "should have content about Help" do
          visit '/static_pages/about'
          page.should have_content('About Us')
       end
    end
end

