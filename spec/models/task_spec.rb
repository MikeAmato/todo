require 'spec_helper'

describe Task do 
  before { @task = Task.new(title: "Walk the dog", completed: true) }

  subject { @task }

  it { should respond_to(:completed) }
  it { should respond_to(:title) }
  it { should be_valid }

  describe "validations" do 
    describe "title" do 
      describe "not present" do
        before {@task.title = " " }
        it { should_not be_valid }
      end

      describe "too short" do
        before { @task.title = "a" * 2}
      it { should_not be_valid }
      end 

      describe "too long" do 
        before { @task.title = "a" * 255 }
        it { should_not be_valid}
      end 

      describe "completed" do 
        it "false by default" do
          @task = Task.new(title: "Walk the dog")
          expect(@task.completed).to be_falsey
        end
      end 

      # describe "incorrect format" do
      #     invalid_titles = ["$" * 6 ]
      #     invalid_titles.each do |invalid_title|
      #       before { @task.title = invalid_title }
      #       it { should_not be_valid }
      #     end
      # end 

      # describe "correct format" do
      #   valid_titles = ["$" * 5, "abc @@@@@", "$$$$#"]
      #   valid_titles.each do |valid_title|
      #     before { @task.title = valid_title }
      #     it { should be_valid }
      #   end      
      # end
    end 
  end 
end 