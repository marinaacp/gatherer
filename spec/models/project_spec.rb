require 'rails_helper'

RSpec.describe Project, type: :model do
  it "considers a project with no tasks to be done" do
    project = Project.new
    expect(project.done?).to be_truthy
  end
end
