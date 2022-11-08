class CreatesProject
  attr_acessor :name, :project

  def initialize(name: "") # arguments to make sure the arguments passed to the CreatesProject initializer are limited to the ones you want.
    @name = name
  end

  def build
    self.project = Project.new(name: name)
  end
end
