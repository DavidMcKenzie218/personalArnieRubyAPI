require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/get.rb'

class TestGet < MiniTest::Test

  def setup

    @allData = [{"id"=>"1", "spoken_word"=>"hello", "response"=>"soundcloud.com/hello_there", "catagory"=>"greeting"}, {"id"=>"2", "spoken_word"=>"goodbye", "response"=>"soundcloud.com/goodbye_for_now", "catagory"=>"farewell"}, {"id"=>"3", "spoken_word"=>"bye", "response"=>"soundcloud.com/bye_sucka", "catagory"=>"farewell"}, {"id"=>"4", "spoken_word"=>"bye", "response"=>"soundcloud.com/leave_now", "catagory"=>"farewell"}]

  end

  def test_CanGetAllData
    allData = Get.all("testData", "personalarnietestdb", "localhost")
    assert_equal(@allData, allData)
  end

  def test_CanGetFirstDataEntry
    data = Get.firstEntry("testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"1", "spoken_word"=>"hello", "response"=>"soundcloud.com/hello_there", "catagory"=>"greeting"}, data)
  end

  def test_CanGetLastDataEntry
    data = Get.lastEntry("testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"4", "spoken_word"=>"bye", "response"=>"soundcloud.com/leave_now", "catagory"=>"farewell"}, data)
  end

  def test_CanGetSecondDataEntry
    data = Get.oneEntry(2, "testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"2", "spoken_word"=>"goodbye", "response"=>"soundcloud.com/goodbye_for_now", "catagory"=>"farewell"}, data)
  end

  def test_CanGetAllOfOneCatagory
    data = Get.oneCatagory("farewell", "testData", "personalarnietestdb", "localhost")
    assert_equal([{"id"=>"2", "spoken_word"=>"goodbye", "response"=>"soundcloud.com/goodbye_for_now", "catagory"=>"farewell"}, {"id"=>"3", "spoken_word"=>"bye", "response"=>"soundcloud.com/bye_sucka", "catagory"=>"farewell"}, {"id"=>"4", "spoken_word"=>"bye", "response"=>"soundcloud.com/leave_now", "catagory"=>"farewell"}], data)
  end

  def test_CanGetFirstOfACatagory
    data = Get.firstOfCatagory("farewell", "testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"2", "spoken_word"=>"goodbye", "response"=>"soundcloud.com/goodbye_for_now", "catagory"=>"farewell"}, data)
  end

  def test_CanGetLastOfACatagory
    data = Get.lastOfCatagory("farewell", "testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"4", "spoken_word"=>"bye", "response"=>"soundcloud.com/leave_now", "catagory"=>"farewell"}, data)
  end

  def test_CanGetSecondOfACatagory
    data = Get.oneOfACatagory(2, "farewell", "testData", "personalarnietestdb", "localhost")
    assert_equal({"id"=>"3", "spoken_word"=>"bye", "response"=>"soundcloud.com/bye_sucka", "catagory"=>"farewell"}, data)
  end

  def test_CanGetAllOfOneSpokenWord

  end

  def test_CanGetFirstOfOneSpokenWord

  end

  def test_CanGetLastOfOneSpokenWord

  end

  def test_CanGetSecondOfOneSpokenWord

  end

end