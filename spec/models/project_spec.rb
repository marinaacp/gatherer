require 'rails_helper'

RSpec.describe Project, type: :model do
  it "considers a project with no tasks to be done" do
    project = Project.new
    task = Task.new
    project.tasks << task
    expect(project.done?).to be_falsy
  end
end
