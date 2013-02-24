require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "without a body or title is is not valid" do
    article = Article.new
    assert !article.save
  end

  test "that with a body and title it is valid" do
    article = Article.new(:title => "This is a title", :body => "This is a body")
    assert article.save
  end

end