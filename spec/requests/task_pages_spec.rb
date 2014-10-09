require 'spec_helper'

describe "task_pages" do
  
  subject { page }

  describe "show page GET /task/:id" do
    let(:task) { Task.create(title: "Do the Dishes") }

    before { visit show_task_path(task.id) }

    it { should have_title("Todo | Show Task") }
    it { should have_selector('h1', "I need to ....") }
    it { should have_selector('p', task.title) }

  end

end