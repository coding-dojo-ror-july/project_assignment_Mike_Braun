require_relative 'project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do 
    @project1 = Project.new('Project 1', 'description 1', 'Bill Clinton')
    @project2 = Project.new('Project 2', 'description 2', 'Bob Dole') # create a new project and make sure we can set the name attribute
  end

  it "has a getter and setter for name attribute" do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end 

  it "has a getter and setter for owner attribute" do #checking to see if you can set and get the owner attribute
    @project1.owner = "New Owner" #this line would fail if our class did not have a setter method
    expect(@project1.owner).to eq("New Owner")# this line would fail if we did not have a getter method or if it did not change the owner successfully in the previous line. 
  end

  it "has a method elevator_pitch to explain name and description" do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1") #checking to see if the elevator pitch actually pulls project 1 and description 1. If not, fail.
    expect(@project2.elevator_pitch).to eq("Project 2, description 2") #checking to see if the elevator pitch actually pulls project 2 and description 2. If not, fail.
  end

  describe "project tasks" do
    it 'has a method add_tasks that pushes a single task to the tasks attribute and a tasks method that returns all the task' do
      1.upto(4) { |n| @project1.add_tasks("Task # #{n}") }
      expect(@project1.tasks).to eq(["Task # 1", "Task # 2", "Task # 3", "Task # 4"])
    end

    it 'has a method print_taks that prints every task in the project' do
      1.upto(2) { |n| @project1.add_tasks("Task # #{n}") }
      expect{ @project1.print_tasks }.to output("Task # 1\nTask # 2\n").to_stdout
    end
  end
end