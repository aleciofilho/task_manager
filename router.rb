class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    while @running
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  def print_actions
    puts '-' * 50
    puts "#{' ' * 10}Welcome to Task Manager!"
    puts '-' * 50
    puts "1. List all tasks"
    puts "2. Add task"
    puts "3. Remove task"
    puts "4. Mark task as done"
    puts "0. Exit"
    puts '-' * 50
    puts "Enter your option:"
  end

  def stop
    @running = false
  end

  def dispatch(index)
    case index
    when 1
      @controller.list
    when 2
      @controller.add
    when 3
      @controller.remove
    when 4
      @controller.mark_as_done
    when 0 then stop
    else
      puts "Please choose one of the previous options"
    end
  end
end