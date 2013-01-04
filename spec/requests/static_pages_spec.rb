require 'spec_helper'

describe "Static pages" do

 subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    it { should_not have_selector 'title', text: '| Home' }
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:author, user: user, nom: "RASAMIZANANY", prenom: "Kune")
        FactoryGirl.create(:author, user: user, nom: "RAKOTO", prenom: "Sam")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.nom, text: item.prenom)
        end
      end
    end
  end

  describe "Help page" do

   before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it { should_not have_selector 'title', text: '| Help' }
  end

  describe "About page" do

    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

 
    it { should_not have_selector 'title', text: '| About' }
  end
end
