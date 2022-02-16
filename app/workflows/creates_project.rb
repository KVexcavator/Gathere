class CreatesProject
  attr_accessor :name, :project

  def initialize(name: "")
    @name = name
  end

  def build
    self.project = Project.new(name: name)
  end
end
