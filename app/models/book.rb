class Book < ApplicationRecord
  require 'aws-sdk-s3'

  belongs_to :user
  belongs_to :category
  belongs_to :section
  has_many :uesrs, through: :like_for_books

  validates :name, presence: true
  validates :user_id, presence: true
  # validates :section_id, presence: true
  # validates :author, presence: true
  # validates :category_id, presence: true

  def book_root
    return "books/book_#{self.id}"
  end

  def get_image
    put_object(path,image)
  end

  def clientMake
    return Aws::S3::Resource.new(
      region: "ap-northeast-1",
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      endpoint: "http://minio:9000",
      force_path_style: true,
    )
  end

  def put_object(path,image)
    client = clientMake().client
    client.put_object(bucket: ENV['AWS_BUCKET'], key: "#{path}/#{image.original_filename}", body: image.read)
  end

  def get_object(path,file_name)
    client = clientMake().client
    return client.get_object(bucket: ENV['AWS_BUCKET'], :key => "#{path}/#{file_name}").body.read
  end

  def list_objects(prefix)
    client = clientMake().client
    client.list_objects(bucket: ENV['AWS_BUCKET'], prefix: prefix).contents.each do |obj|
      self.get_object(prefix, obj)
    end
  end
end
