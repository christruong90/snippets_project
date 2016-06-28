class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to snippet_path(@snippet)
    else
      render :new
    end
  end

  def edit
    @snippet = Snippet.find params[:id]
  end


  def show
    @snippet = Snippet.find params[:id]
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_path, notice: "Snippet Deleted!"
  end

  def show_category
    ## add index to name
    # @category.find_by_name
    @category = Category.where(name: params[:category]).first
    # find_by_category
    @snippets = Snippet.where(category: @category.id)
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :work, :category_id)
  end

  def category_params
  end
end
