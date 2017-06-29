require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/get.rb'
require_relative '../models/post.rb'

class TestPost < MiniTest::Test

  def test_canPostOneResponse

    Post.__forTestingOnly("personalarnietestdb", "localhost")

    Post.oneResponse({spoken_word: "test", response: "echo test", catagory: "test Catagory"}, "postTestData", "personalarnietestdb", "localhost")
    postData = Get.all("postTestData", "personalarnietestdb", "localhost")
    assert_equal([{"id" => "1","spoken_word" => "test", "response" => "echo test", "catagory" => "test Catagory"}], postData)

  end

  def test_canPostManyResponses

    Post.__forTestingOnly("personalarnietestdb", "localhost")

    Post.manyResponses([{spoken_word: "test 1", response: "echo test 1", catagory: "test Catagory 1"}, {spoken_word: "test 2", response: "echo test 2", catagory: "test Catagory 2"}, {spoken_word: "test 3", response: "echo test 3", catagory: "test Catagory 3"}], "postTestData", "personalarnietestdb", "localhost")
    postData = Get.all("postTestData", "personalarnietestdb", "localhost")
    assert_equal([{"id" => "1", "spoken_word" => "test 1", "response" => "echo test 1", "catagory" => "test Catagory 1"}, {"id" => "2","spoken_word" => "test 2", "response" => "echo test 2", "catagory" => "test Catagory 2"}, {"id" => "3","spoken_word" => "test 3", "response" => "echo test 3", "catagory" => "test Catagory 3"}], postData)

  end

end