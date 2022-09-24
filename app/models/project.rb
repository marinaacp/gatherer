class Project < ApplicationRecord
  attr_accessor :tasks

  def new
    @tasks = []
  end

  def done?
    tasks.empty?
  end
end
