class ProductsController < ApplicationController
  #skip_before_filter :require_login
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index 
   if params[:category]
    @products = Product.where(:category => params[:category])
  else
    @products = Product.all
  end
     if params[:search] 
    @products = Product.search(params[:search])
    end
  if @products.class == Array
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(5) 
  else
    @products = @products.page(params[:page]).per(5) # if @posts is AR::Relation object 
  end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end
  

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product '#{@product.name}' was successfully created!" }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: " Product '#{@product.name}'was successfully updated!" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product '#{@product.name}' was successfuly deleted!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
    params.require(:product).permit(:name, :description, :image, :category, :price)
  end
end
