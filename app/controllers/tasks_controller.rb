class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :taskCheck

  # Make sure we only select the attributes we want from the backbone request.
  def pick (hash, *keys)
    filtered = {}
    hash.each do |key, value|
      filtered[key.to_sym] = value if keys.include?(key.to_sym)
    end
    filtered
  end

  # someone needs to refactor this.
  def taskCheck
    if Task.where(:user_id => current_user.id).empty?
      (0..24).each do |i|
        task = Task.new
        task.type_task = i
        task.user_id = current_user.id
        task.save
      end
    end
  end

  # GET /tasks
  # GET /tasks.json
  def app
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id


    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    params[:task][:completed].to_i == 1 ? completed = DateTime.now().to_s : completed = nil
    params[:task][:completed] = completed

    respond_to do |format|
      if @task.update_attributes pick(params[:task], :text, :completed)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  #GET /tasks/test
  def test_update
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html #test_update.html.erb
      format.json {render json: @allTasks}
    end
  end
end





