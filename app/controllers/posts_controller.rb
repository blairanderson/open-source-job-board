class PostsController < ApplicationController
  before_action :require_user_signed_in, only: [:edit, :create, :update, :destroy]
  before_action :set_post, only: [:show, :apply_to, :preview, :edit, :update, :destroy, :vote]
  before_action :require_user_owns_post, only: [:preview, :edit, :update, :destroy]

  def index
    @posts = Post.published
  end

  def show
  end

  def preview
  end

  def apply_to
    address = @post.how_to_apply_address
    if @post.how_to_apply == "apply_by_email"
      redirect_to "mailto:#{address}"
    elsif @post.how_to_apply == "apply_by_url"
      redirect_to address
    else
      redirect_to @post, notice: "sorry...  :("
    end
  end

  def new
    @posts_published  = current_user.posts.published rescue []
    @posts_drafted    = current_user.posts.draft rescue []
    @post             = Post.new({job_type: 0,how_to_apply: 0})
  end

  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if current_user
      @post.user = current_user
    end

    respond_to do |format|
      if @post.save
        session[:post_id] = @post.id
        format.html { redirect_to preview_post_path(@post), notice: 'Preview!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html do
          @posts_published  = current_user.posts.published rescue []
          @posts_drafted    = current_user.posts.draft rescue []
          render :new
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:status] && params[:status].in?(Post.statuses.keys)
      respond_to do |format|
        if @post.send("#{params[:status]}!")
          format.html { redirect_to post_path(@post), notice: 'Success!' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :preview }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
      return
    #   YOLO: move this to another action
    end

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to preview_post_path(@post), notice: 'Preview' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote
    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @post.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def require_user_owns_post
    raise "Not found" unless @post
    raise "Not found" unless current_user
    raise "Not Found" unless @post.user_id == current_user.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :rate, :location, :job_type, :description, :company_name, :company_url, :company_logo, :how_to_apply, :how_to_apply_address, :contact_email)
  end
end
