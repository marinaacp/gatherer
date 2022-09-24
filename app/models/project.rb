class Project < ApplicationRecord
  attr_accessor :tasks

  def new
    @tasks = []
  end

  def done?
    true
  end
end
