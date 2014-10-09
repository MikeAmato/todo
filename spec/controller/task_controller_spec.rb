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




  
end