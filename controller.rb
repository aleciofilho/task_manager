class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    @view.display(@repository.all)
  end

  def add
    # ask for description
    description = @view.ask_for_description
    
    # instantiate new task
    task = Task.new(description)

    # create task
    @repository.create(task)
  end

  def remove
    # list all tasks
    list

    # ask for index
    index = @view.ask_index

    # destroy task
    @repository.destroy(index)
  end

  def mark_as_done
    # list all tasks
    list

    # ask for index
    index = @view.ask_index
    
    # retrieve task
    task = @repository.find(index)
    
    # update task
    @repository.mark_as_done(task)
  end
end