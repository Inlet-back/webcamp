class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end

  def index
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
      flash[:notice] = "更新に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "更新に失敗しました。"
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
end
