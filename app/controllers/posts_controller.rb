class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #agregndo helper de autenticacion 
  #lo de abajo es lo mismo, solo que como hay que especificar as metodos, ponemos el except, que tenga que estar autenticado excepto en los metodps index(mostrar todos) y show(ver post especifico)
  #before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]
  #llamar a ese metodo antes de llamar a los metodos que estan dentro de los []
  before_action :correct_user, only: [:update,:edit,:destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    #modificando para pasar parametro de id usuario
    @post = Post.new
    #@post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #modificando para pasar parametro de id usuario
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def correct_user
      @post = current_user.posts.find_by(id: params[:id]) #tendra el valor del id del usuario actual
      redirect_to post_path, notice: "No está autorizado para modificar este post" if @post.nil? #esto solo cuando la variable post sea igual a new(cuando no se encuentre el id del usuario actual)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description)
    end
end
