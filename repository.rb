class Repository
  def initialize(csv_file)
    @csv_file = csv_file
    @tasks = []
    load_csv if File.exist?(@csv_file)
  end

  def all
    @tasks
  end

  def find(task_index)
    @tasks[task_index]
  end

  def create(task)
    @tasks << task
    save_csv
  end

  def destroy(task_index)
    @tasks.delete_at(task_index)
    save_csv
  end

  def mark_as_done(task)
    task.mark_as_done!
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      description = row[0]
      done = row[1] == 'true'
      task = Task.new(description)
      task.mark_as_done! if done
      @tasks << task
    end 
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @tasks.each do |task|
        file << [task.description, task.done?]
      end
    end
  end
end