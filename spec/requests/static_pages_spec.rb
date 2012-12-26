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
