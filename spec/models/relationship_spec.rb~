require 'spec_helper'

describe Relationship do
  let(:author) { FactoryGirl.create(:author) }
  let(:publication) { FactoryGirl.create(:publication) }
  let(:relationship) { author.relationships.build(publication_id: publication.id) }
   subject { relationship }

  it { should be_valid }

  #describe "accessible attributes" do
   # it "should not allow access to author_id" do
    #  expect do
     #   Relationship.new(author_id: author.id)

      #end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    #end    
  #end
  describe "author methods" do    
    it { should respond_to(:author) }
    it { should respond_to(:publication) }
    its(:author) { should == author }
    its(:publication) { should == publication }
  end

   describe "when publication id is not present" do
    before { relationship.publication_id = nil }
    it { should_not be_valid }
  end

  describe "when author id is not present" do
    before { relationship.author_id = nil }
    it { should_not be_valid }
  end


end
