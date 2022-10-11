class Project
  attr_accessor :tasks, :due_date

  def initialize
    @tasks = []
  end

  def incomplete_tasks
    tasks.reject(&:complete?) # refactoring - Rejeita tudo q for true
  end

  def done?
    incomplete_tasks.empty?
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end

  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / 21
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan? # para o caso de n ter task n criar uma exceção
    (Time.zone.today + projected_days_remaining) <= due_date
  end
end
