class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(books_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. トップ画面へリダイレクト
    redirect_to '/books'
  end 
  
  def show
    @book = Book.find(params[:id])
  end
  
  
  private
  # ストロングパラメータ
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
