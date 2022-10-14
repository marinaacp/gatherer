class Task
  attr_accessor :size, :completed_at

  def initialize(options = {})
    mark_completed(options[:completed_at]) if options[:completed_at]
    @size = options[:size]
  end

  def mark_completed(date = Time.current)
    @completed_at = date
  end

  def complete?
    completed_at.present?
  end

  def part_of_velocity?
    return false unless complete? # executa o codigo se a condicional for falsa
    completed_at > Project.velocity_length_in_days.days.ago
                                # não enetndi. para pegar só as tarefas completas com menos de 21 dias desde completas -
                                # (3) do knows its velocity n seria o simbolo oposto <?
  end

  def points_toward_velocity
    part_of_velocity? ? size : 0 # if parte_of_velocity do size else 0
  end
end
