class Task
  attr_accessor :size, :completed

  def initialize(options = {})
    # @completed = false
    @completed = options[:completed] # se em lugar nenhum defino como false,
    # o valor default é true, e só tenho completed = true ?
    @size = options[:size]
  end

  def mark_completed
    @completed = true
  end

  def complete?
    @completed
  end
end
