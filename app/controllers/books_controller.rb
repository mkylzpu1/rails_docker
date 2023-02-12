class BooksController < ApplicationController
  layout 'dashboard'
  require 'zip'
  require 'aws-sdk-s3'
  # require './app/logic/test'

  def index
    @books = Book.all()
  end

  def new
    @book = Book.new()
  end

  def create
    ActiveRecord::Base.transaction do
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      # image = params[:book_image_path]
      @book.save!

      # put_object(@book.book_root, image)
    end
  end

  def test
    client = Aws.client()

    image = params[:book_image_path]
    logger.debug(image.read)
    logger.debug("^^^^^^^^-----")

    client.put_object(bucket: ENV['AWS_BUCKET'], key: "test/auo/test", body: image.read)
  end

  private
    def book_params
      params.require(:book).permit(:name, :author, :section_id, :category_id)
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
end
