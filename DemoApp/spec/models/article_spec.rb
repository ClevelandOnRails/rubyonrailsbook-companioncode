require 'spec_helper'

describe Article do
  before { @article = Article.new(title: "Example Title", body: "this is a body") }

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:body) }

  describe "when body is not present" do
    before { @article.body = "" }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @article.title = "" }
    it { should_not be_valid }
  end

  describe "when both title and body are present" do
    it { should be_valid }
  end

  describe "when both title and body are not present" do
    before { @article.title = "", @article.body = ""}
    it { should_not be_valid }
  end

  describe "@article should not respond to crackerjacks" do
    it { should_not respond_to(:crackerjacks)}
  end
end