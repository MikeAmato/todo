require 'spec_helper'

describe "task_pages" do
  
  subject { page }

  describe "show page GET /task/:id" do
    let(:task) { Task.create(title: "Do the dishes", completed: true, description: "Dog walking",
     due_at: Date.today) }

    before { visit task_path(task.id) }

    it { should have_title("Todo | Show Task") }
    it { should have_selector('h1', "I need to ....") }
    it { should have_selector('p', task.title) }

  end


  describe "new page GET /task/new" do 
    #Visit the new page
    before { visit new_task_path }

    it { should have_title("Todo | New Task") }
    it { should have_selector('h1', "New Task") }
    #test that it has the correct title and header
    
    #test the create action
    describe "create POST /task" do 
      let(:submit) { "Create" }

      context "Valid information" do
        before do
          visit new_task_path
          fill_in "Title", with: "Walk the dog"
          check 'task_completed'
          fill_in "Due at", with: 2.weeks.from_now.to_date
        end
        it "creates task" do 
          expect { click_button submit }.to change(Task, :count).by(1)
        end

        describe "after submission" do 
          before { click_button submit }

          it { should have_title('Todo | Show Task') } 
          it {should have_selector('p', 'Walk the dog') }
        end 
      end
      
      context "invalid information"  do 
        it "does not create task" do 
          expect { click_button submit }.not_to change(Task, :count)
        end

        describe "after submission" do 
          before { click_button submit}

          it {should have_title('Todo | New Task') }
          it { should have_content('error')}
        end 
      end   
    end 
  end


  describe "index page GET /task" do 
    before {visit task_path }

    it {should have_title('Todo | My Task') }
    it {should have_selector('h1', 'All Task') }

    describe "destroy delete /task/:id" do 
      it { should have_link('delete', href: task_path(task.id))}

      it "destroys the task" do 
        expect{
          click_link('delete', match: :first)
        }.to change(Task, :count).by(-1)
      end 
    end 
  end

  describe "GET edit" do 
    let(:task) {Task.create(title: "Walk the dog", completed: true, description: "Dog walking",
     due_at: Date.today) }

    it "renders :edit" do 
      get :edit, id: task.id 
       expect(response).to render_template(:edit)
    end

    it "assigns requested task to @task" do 
      get :edit, id: task.id
      assigns(:task).should eq(task)
    end 
  end 

  describe "edit page GET /tasks/:id/edit" do 
    let(:task) {Task.create(title: "Do the dishes", completed: true, description: "Dog walking",
     due_at: Date.today) }

    before { visit edit_task_path(task.id)}

    it { should have_title("Todo | Edit Task")}
    it { should have_selector('h1', text: 'Edit Task') }    

    describe "update PUT /tasks/:id" do 
      let(:submit) {"Save Changes"}

      context "vaild information" do 
        before do
          fill_in "title", with: "Walk the dog"
          click_button submit
        end

        it {should have_title("Todo | Show Task") }
        it {should have_selector('p', text: "Walk the dog") }
        specify { expect(task.reload.title).to eq("Walk the dog") }
      end  

      context "invalid information" do 
        before do
          fill_in "Title", with: " "
          click_button submit
        end 
        it { should have_title('Todo | Edit Task') }
        it { should have_content('error') }
      end 
    end
  end 
end