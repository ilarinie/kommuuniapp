class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy, :complete]
  before_action :ensure_that_signed_in

  # GET /chores
  # GET /chores.json
  def index
    @chores = Chore.where('private=? OR private=?',false,nil)
    @privatechores = Chore.where(private:true, creator_id:current_user.id)
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
    if @chore.private && current_user.id != @chore.creator_id
      redirect_to :root, notice: 'That chore is private'
    end
    @users = @chore.sort_users_by_task_count
    @tasks = Task.where(chore:@chore).order(created_at: :desc).limit(10)
  end

  # GET /chores/new
  def new
    @chore = Chore.new
    @priorities = ['hours', 'days', 'weeks']
  end

  # GET /chores/1/edit
  def edit
    if @chore.private && current_user.id != @chore.creator_id
        redirect_to :root, notice: 'That chore is private'
    end
     @priorities = ['hours', 'days', 'weeks']
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
    @chore.prioritycalc(params[:chore][:priorities])
    @chore.creator_id = current_user.id
    respond_to do |format|
      if @chore.save
        @chore.add_to_every_user if not @chore.private?
        format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
        format.json { render :show, status: :created, location: @chore }
      else
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
      @chore.destroy
      respond_to do |format|
        format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  def complete
    if @chore.complete current_user
      redirect_to :back, notice: 'Nicely done'
    else
      redirect_to :root, notice: 'Something went wrong, try again'
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:name, :priority, :reward, :private, :completion_text, :priorities)
    end
end
