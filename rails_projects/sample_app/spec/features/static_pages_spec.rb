require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
=begin
    it "should have title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | Home')
    end
=end
  end

     describe "Help page" do
    
      it "should have the h1 Help" do
        visit '/static_pages/help'
        page.should have_selector('h1', :text => 'Help')
      end
=begin
    it "should have title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | Help')
    end
=end
  end

     describe "About page" do
  
       it "should have the h1 'About Us'" do
          visit '/static_pages/about'
          page.should have_selector('h1', :text => 'About Us')
       end
=begin    
     it "should have title 'About us'" do
        visit '/static_pages/about'
      page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | About Us')
    end
=end
   end

   end


