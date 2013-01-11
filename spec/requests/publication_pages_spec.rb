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
		page.should have_selector('li', text: publication.titre,text: publication.typePublication, text: publication.nom,text: publication.annee, text: publication.mois, text: publication.pages, text: publication.notes, text: publication.resume)
	      end
	    end
	end
        describe "generate" do

	    before do 
                    sign_in FactoryGirl.create(:user)
                    visit generate_path 
            end

	    let(:submit) { "Generate new publication" }

	    describe "with invalid information" do
	      it "should not create a publication" do
		expect { click_button submit }.not_to change(Publication, :count)
	      end
	    end

	    describe "with valid information" do
	      before do
		fill_in "Titre",         with: "My life"
		fill_in "Typepublication",        with: "biographique"
		fill_in "Nom",     with: "the storm"
		fill_in "Annee", with: "1986"
                fill_in "Mois",     with: "Fevrier"
		fill_in "Pages", with: "150"
                fill_in "Notes",     with: "azerty"
		fill_in "Resume", with: "Ma vie"
	      end

	      it "should create a publication" do
		expect { click_button submit }.to change(Publication, :count).by(1)
	      end
	    end
	end
end
