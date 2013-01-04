require 'spec_helper'

describe Author do

  let(:user) { FactoryGirl.create(:user) }
  before {
    @author = user.authors.build(nom: "RASAMIZANANY",prenom:"kune")
  }

  subject { @author}

  it { should respond_to(:nom) }
  it { should respond_to(:prenom) }
  it { should respond_to(:user_id) }

  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @author.user_id = nil }
    it { should_not be_valid }
  end
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Author.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  describe "when user_id is not present" do
    before { @author.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank nom" do
    before { @author.nom = " " }
    it { should_not be_valid }
  end

  describe "with nom that is too long" do
    before { @author.nom = "a" * 141 }
    it { should_not be_valid }
  end
  
  describe "with blank prenom" do
    before { @author.prenom = " " }
    it { should_not be_valid }
  end

  describe "with prenom that is too long" do
    before { @author.prenom = "a" * 141 }
    it { should_not be_valid }
  end
end

