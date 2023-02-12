# class Test
#   require 'aws-sdk-s3'

#   def self.client
#     return Aws::S3::Resource.new(
#       region: "ap-northeast-1",
#       access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#       endpoint: "http://minio:9000",
#       force_path_style: true,
#     )
#   end

#   def self.test
#     return "test"
#   end
# end
