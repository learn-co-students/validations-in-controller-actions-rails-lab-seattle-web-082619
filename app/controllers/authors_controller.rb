class AuthorsController < ApplicationController
  def show
    @author = author_find_param
  end

  def new
  end

  def create
    @author = Author.create(author_params)
      if @author.valid? 
      @author.save
    redirect_to author_path(@author)
    else 
      render :new 
    end 
  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def author_find_param
    Author.find(params[:id])
  end 
  
end
