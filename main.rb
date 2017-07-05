class Project
    attr_accessor :project_name, :project_description

    def initialize(name, description)
        @project_name = name
        @project_description = description
    end

    def elevator_pitch
        puts "The name is #{@project_name}, which is #{@project_description}."
    end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.project_name
project1.elevator_pitch