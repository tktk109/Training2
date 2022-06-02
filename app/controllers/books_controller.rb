class BooksController < ApplicationController

  
  # def new
    # @book = Book.new
  # end
  def index
    
    @books = Book.all
    @book = Book.new
    
  end
  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all.order(id: :asc)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. トップ画面へリダイレクト
      # redirect_to book_path(@book.id)
      flash[:alert] = 'Book was successfully create.'
      redirect_to book_path(@book)
      # ,notice: 'Book was successfully created.'
    else
      render :index
    end 
  end




  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:alert] = 'Book was successfully updete.'
    redirect_to book_path(book.id)
    # , notice:'Book was successfully updated.'
    # redirect_to '/books', notice:'Book was successfully destroyed.'
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:alert] = 'Book was successfully destroy.'
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end