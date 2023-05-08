class View
  def display(tasks)
    tasks.each_with_index do |task, index|
      puts "#{task.done? ? '[X]' : '[ ]'} #{index +1} - #{task.description}"
    end
  end

  def ask_for_description
    puts "What is your task description?"
    gets.chomp
  end

  def ask_index
    puts "Enter the index"
    gets.chomp.to_i - 1
  end
end