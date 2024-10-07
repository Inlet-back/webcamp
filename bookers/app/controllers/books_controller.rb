class BooksController < ApplicationController


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "failed to create Book."
      @books = Book.all
      render :index,status: :unprocessable_entity
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "failed to edit Book."
      render :edit
    end
  end
    
  
  def destroy
    @book = Book.find(params[:id])
   if @book.destroy
      flash[:notice] = "削除に成功しました。"
      redirect_to books_path
    else
      flash.now[:alert] = "削除に失敗しました。"
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
