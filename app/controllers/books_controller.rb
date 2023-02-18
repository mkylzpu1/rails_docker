class BooksController < ApplicationController
  layout 'dashboard'
  require 'zip'
  require 'aws-sdk-s3'
  # require './app/logic/test'

  before_action :set_book, only: [:show, :edit]

  def index
    @books = Book.all()
    @book_times = BookTime.all()
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

  def show
    @book_times = BookTime.where(book_id: params[:id])
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

    def set_book
      @book = Book.find_by(id: params[:id])
    end
end
