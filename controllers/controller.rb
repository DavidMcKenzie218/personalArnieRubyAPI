require 'json'

require_relative '../models/get.rb'
require_relative '../models/post.rb'

#INDEX

get('/responses.json') do
  @responses = Get.all("testData", 'personalarnietestdb', 'localhost')
  content_type :json
  @responses.to_json

end