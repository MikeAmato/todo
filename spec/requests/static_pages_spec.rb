require 'spec_helper'

describe "static_pages" do
  
  subject { page }

  describe "home page" do
    # 1. visit the home page
    before { visit home_path }
    # test - it should have a h1 of welcome
    it { should have_selector('h1', "Welcome") }  
    # test - it should have a title of todo | home
    it { should have_title("Todo | Home") }
  end


  describe "about" do
    #2. visit the about page
    before { visit about_path }
    # it should have h1 tag of "about me "
    it { should have_selector('h1', "About") }
    # it should have a title of "Todo | about me"
    it { should have_title("Todo | About") }
  end 


  describe "help" do 
    #3. visit the help page
    before { visit help_path }
    # it should have h1 of help
    it { should have_selector('h1', "Help") }
    # it should have title of "Todo | Help"
    it { should have_title("Todo | Help") }
  end

end