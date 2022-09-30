class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    # tasks.empty?
    tasks.all?(&:complete?) # não entendi como primeiro teste passou
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    tasks.reject(&:complete?).sum(&:size)
  end
end
