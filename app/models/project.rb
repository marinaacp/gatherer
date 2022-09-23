class Project < ApplicationRecord
  has_many :tasks
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    tasks.empty?
  end
end
