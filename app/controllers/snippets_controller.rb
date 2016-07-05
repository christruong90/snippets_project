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

  def update
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice:"Snippet updated!"
    else
      render :edit
    end
  end

  def show
    @snippet = Snippet.find params[:id]
    @snippet_category = @snippet.category.name.to_sym
  end

  def destroy
    @snippet = Snippet.find params[:id]
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

  def update

    @snippet = Snippet.find params[:id]
    if @snippet.update snippet_params
      # flash[:notice] = "update successful"
      redirect_to snippet_path(@snippet), notice: "update successful"
    else
      render :edit
    end
  end

  private


  def snippet_params
    params.require(:snippet).permit(:title, :work, :category_id)
  end

  def category_params
  end
end
