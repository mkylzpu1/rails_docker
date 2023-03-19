class WordsController < ApplicationController
  layout 'dashboard'

  def index
  end

  def upload
    redirect_to word_complete_path
  end

  def complete
  end
end
