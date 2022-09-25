class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    # tasks.empty?
    tasks.all?(&:complete?) # não entendi como primeiro teste passou
  end
end
