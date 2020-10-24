class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    @books = Book.where(author_id: current_user.id).order('created_at DESC')
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)
    @groups = params[:book][:group_ids]
    @book.save

    current_book_groups = @book.groups
    @groups.each do |group|
      if !group.empty?
        gp = Group.find(group)
        @book.groups << gp if !current_book_groups.include?(gp)
      end
    end

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    if current_user == @book.author

      @groups = params[:book][:group_ids]
      @book.save

      current_book_groups = @book.groups
      @groups.each do |group|
        if !group.empty?
          gp = Group.find(group)
          @book.groups << gp if !current_book_groups.include?(gp)
        end
      end

      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to @book, notice: 'Book was successfully updated.' }
          format.json { render :show, status: :ok, location: @book }
        else
          format.html { render :edit }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
      
    else
      redirect_to root_path
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])

    if current_user == @book.author

      @book.destroy
      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end

    else
      redirect_to root_path
    end
  end

  def ungrouped
    @all_books = Book.where(author_id: current_user.id).includes(:groups)
    @books = []

    @all_books.each do |book|
      @books << book if book.groups.empty?
    end

    @total_amount = my_sum(@books, 'amount')
    @total_time = my_sum(@books, 'time')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :book_author, :amount, :time)
    end

    def my_sum(array, string)
      sum = 0
      if string == "amount"
        array.each do |a|
          sum += a.amount
        end
      end

      if string == 'time'
        array.each do |a|
          sum += a.time
        end
      end

      sum
    end
end
