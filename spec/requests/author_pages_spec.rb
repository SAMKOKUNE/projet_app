require 'spec_helper'

describe "AuthorPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "author creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an author" do
        expect { click_button "Post" }.not_to change(Author, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
	fill_in 'author_nom', with: "RASAMIZANANY"
        fill_in 'author_prenom', with: "Kune" 
      end

      it "should create an author" do
        expect { click_button "Post" }.to change(Author, :count).by(1)
      end
    end
  end
end
