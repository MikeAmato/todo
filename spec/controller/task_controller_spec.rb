# create a GET tasks#show page when the user visits /tasks/:id
require 'spec_helper'

describe TaskController, type: :controller do 
  describe "GET show" do 
    before { @task = Task.new(title: "walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today)}
      
    it "renders show page" do 
      get :show, id: @task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do 
      get :show, id: task.id 
      #expect @task to bo set to the task we're looking for
      assigns(:task).should eq(@task)
    end 
  end

  describe "GET index" do
    before { Task.destroy_all }

    let(:first_task) { Task.create(title: "Walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today) }
    let(:second_task) { Task.create(title: "Buy Groceries", completed: true, description: "Dog walking",
     due_at: Date.today) }

    it "renders :index" do 
      get :index
      expect(response).to render_template(:index)
    end 

    it "assigns all tasks to @tasks as an array" do 
      get :index
      expect(:task).should eq([first_task, second_task])
    end
  end

  describe "GET #new" do 
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new item to the /task" do 
      get :new
      assigns(:task).should be_a_new(Task)
      @task = Task.new
    end
  end

  describe "GET #edit" do 
    it "renders :edit"
    it "allows edting of the /tasks/:id"
  end 

  describe "POST create Todo item /task" do
    context "valid attributes" do
      it "creates task"  do
        #when i post to the create action, change Task.count by 1, aka add 1 to the 
          #tasks db
        expect{
          post :create, task: {title: "Walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today}
        }.to change(Task, :count).by(1)
      end #adds a new task
      
      it "redirects to :show" do 
        post :create, task: {title: 'Walk the dog', completed: true, description: "Dog walking",
     due_at: Date.today}
        last_task = Task.last 
        expect(response).to redirect_to(task_path(last_task.id))
      end 
    end
    
    context "invalid attributes" do 
      it "does not create task" do 
       expect{
          post :create, task: {title: ""}
        }.to_not change(Task, :count)
      end

      it "re-renders :new" do 
        post :create, task: { title: ""}
        expect(response).to render_template(:new)
      end 
    end
  end

  describe "PUT update" do 
    let(:task) {Task.create(title: "Walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today) }

    context "vaild attributes" do 
      it "changes @task's attributes" do 
        put :update, id: task.id, task: {title: "Walk the Dog", completed: true, description: "Dog walking",
     due_at: Date.today}
        task.reload
        expect(task.title).to eq("Do the Dishes")
      end 
      it "redirect to :show" do
        put :update, id: task.id, task: { title: "Walk the Dog", completed: true, description: "Dog walking",
     due_at: Date.today}
        last_task = Task.last 
        expect(response).to redirect_to(task_path(last_task.id))
      end
    end

    context "invalid attributes" do 
      it "does not change @task's attributes" do 
        put :update, id: task.id, task: {title: ""}
        task.reload
        expect(task.title).to eq("Do the Dishes")
      end

      it "re-renders :edit" do 
        put :update, id: task.id, task: {}
      end

    end

  end


  describe "DELETE destroy" do 
    let(:task) { Task.create(title: "Walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today) }

    it "deletes the requested task" do
      expect{
        delete :destroy, id: task.id
      }.to change(Task, :count).by(1)
    end 

    it " redirects to index" do 
      delete :destroy, id: task.id
      expect(response).to redirect_to(task_path)
    end 
  end 
end