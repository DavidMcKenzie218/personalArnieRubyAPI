require 'json'

require_relative '../models/get.rb'
require_relative '../models/post.rb'

#INDEX

get('/responses.json') do
  @responses = Get.all("testData", 'personalarnietestdb', 'localhost')
  content_type :json
  @responses.to_json

end

#CREATE

post('/responses') do
  request.body.rewind
  parsedData = JSON.parse request.body.read
  data = {spoken_word: parsedData["spoken_word"], response: parsedData["response"], catagory: parsedData["catagory"]}
  print data
  Post.oneResponse(data, "testData", "personalarnietestdb", "localhost")
  content_type :json
end