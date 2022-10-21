# class Project
#   attr_accessor :tasks, :due_date

#   def initialize
#     @tasks = []
#   end

#   def incomplete_tasks
#     tasks.reject(&:complete?) # refactoring - Rejeita tudo q for true
#   end

#   def done?
#     incomplete_tasks.empty?
#   end

#   def total_size
#     tasks.sum(&:size)
#   end

#   def remaining_size
#     incomplete_tasks.sum(&:size)
#   end

#   def completed_velocity
#     tasks.sum(&:points_toward_velocity)
#   end

#   def current_rate
#     completed_velocity * 1.0 / Project.velocity_length_in_days
#   end

#   def projected_days_remaining
#     remaining_size / current_rate
#   end

#   def on_schedule?
#     return false if projected_days_remaining.nan? # para o caso de n ter task n criar uma exceção
#     (Time.zone.today + projected_days_remaining) <= due_date
#   end

#   def self.velocity_length_in_days
#     21
#   end

# end

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy #se destruo um projeto tbm vou destruir as tasks dele

  def self.velocity_length_in_days # esse self chama o Project (velocity... é um metodo de classse, por isso o self aponta p classe)
    21 # aqui poderia ter escrito, sem o self Project.velocity_lenght_in_days = 21 ?
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
    completed_velocity * 1.0 / Project.velocity_length_in_days
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan? # para o caso de n ter task n criar uma exceção
    (Time.zone.today + projected_days_remaining) <= due_date
  end

end
