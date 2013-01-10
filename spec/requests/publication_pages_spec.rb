require 'spec_helper'

describe "Publication pages" do
subject { page }
describe "index" do
	    before do
	      sign_in FactoryGirl.create(:user)
	      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
	      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
	      visit publications_path
	    end

	    it { should have_selector('title', text: 'All publications') }
	    it { should have_selector('h1',    text: 'All publications') }

	    it "should list each publication" do
	      Publication.all.each do |publication|
		page.should have_selector('li', text: publication.titre)
	      end
	    end
	end
end
