class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy]
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
    @users = sort_users_by_task_count
  end

  # GET /chores/new
  def new
    @chore = Chore.new
    @priorities = {"hours", "days", "weeks"}
  end

  # GET /chores/1/edit
  def edit
    if @chore.private && current_user.id != @chore.creator_id
        redirect_to :root, notice: 'That chore is private'
    end
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
    @chore.creator_id = current_user.id
    respond_to do |format|
      if @chore.save
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

  # POST /publishchore
  # Makes a private chore public
  def publish
    @chore = Chore.find(params["format"])
    if current_user.id == @chore.creator_id
      @chore.private = false
      if @chore.save
        redirect_to chores_path, notice: 'Chore made visible to everyone'
      end
    else
      redirect_to :root, notice: 'Not your chore'
    end

  end

  def complete
    task = Task.new
    task.user = current_user
    task.chore = Chore.find(params["format"])
    if task.save
      if not task.chore.private
        if task.chore.completion_text.nil?
        TelegramApi.send_to_channel ""+task.user.to_s+" has just finished "+task.chore.to_s+""
        else
          TelegramApi.send_to_channel ""+task.user.to_s+" "+task.chore.completion_text
        end
      xp = Xp.create source:"Chore: "+task.chore.name, points:task.chore.reward
      current_user.xps << xp
    end
      redirect_to :root, notice: 'Nicely done'
    else
      redirect_to :root, notice: 'Something went wrong, try again'
    end
  end


  def sort_users_by_task_count
    @users = User.active
    maarat = {}
    @users.each do |user|
      maarat[user.id] = Task.where(user_id:user.id, chore_id:@chore.id).count
    end
    maarat.sort_by {|k,v| v}.reverse
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:name, :priority, :reward, :private, :completion_text)
    end
end
