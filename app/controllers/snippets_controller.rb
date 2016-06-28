class SnippetsController < ApplicationController

  def new

  end

  def edit

  end

  def create

  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def destroy

  end

end
