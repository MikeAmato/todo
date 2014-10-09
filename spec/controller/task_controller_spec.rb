# create a GET tasks#show page when the user visits /tasks/:id
require 'spec_helper'

describe TaskController, type: :controller do 
  describe "GET show" do 
    before { @task = Task.create(title: "Walk the dog", completed: true, 
      description: "Dog walking") }
      
    it "renders show page" do 
      get :show, id: @task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do 
      get :show, id: @task.id 
      #expect @task to bo set to the task we're looking for
      assigns(:task).should eq(@task)
    end 
  end

  describe "GET #index" do
    it "grabs all of the Todo list"
    it "displays the #index view"
  end

  describe "GET #new" do 
    it "displays the #new view"
    it "adds another item to the Todo list"
  end

  describe "GET #edit" do 
    it "displays the #edit view"
    it "allows edting of the Todo list"
  end 

  describe "POST create Todo item /task" do
    context "with a valid item" do
      it " adds another item to the Todo list"
      it "redirects to the new item on Todo list"
    end
    
    context "without a valid item" do 
      it "does not add an item to Todo list"
      it "redisplays the #new view with error shown"
    end
  end

  describe "PUT update Todo list item /task" do
    context "with a valid item" do 
      it "locates the correct Todo list item"
      it "updates the Todo list item"
      it "redirects to the updated Todo list item"
    end

    context "without a valid item" do
      it "locates the correct Todo list item"
      it "does not update Todo list item"
      it "redirects to #edit and displays error"
    end
  end


  describe "DELETE item" do 
    it "deletes item from the Todo list"
    it "redirects to the Todo list #index"
  end 
end