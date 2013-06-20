class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

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
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js { return_msg "Post created successfully"}
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.js { return_msg "Post created successfully"}
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def info
     @post = Post.find(params[:id])
  end

  def custom_form

  end

  def process_custom_data   # for collection 
    #render :text => params[:q]
    #render :text => "checkbox 1 is #{params[:pet_dog]} , checkbox 2 is #{params[:pet_cat]}"
    #render :text => "Radio 1 is #{params[:age]} , radio 2 is #{params[:old_age]}"
    post = Post.new
    post.title = params[:query]
    post.content = params[:age]
    post.user_id = params[:user_id]
    post.created_at = params[:created_at]
    # if params have two name like hidden_field(:user , :phone) ,,. > params[:user][:name]
    
    if post.save
      flash[:notice] = "successfully save"
      redirect_to posts_path
    else
      flash[:alert] = "Failes to save"
      render :action => "custom_form"
    end
  end

  def process_custom_data(post)     # not same with process_custom_data >> relate to route (member)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id , :contact , :body)
    end
end
