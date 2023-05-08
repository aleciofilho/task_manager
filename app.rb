require 'csv'
require_relative 'task'
require_relative 'repository'
require_relative 'view'
require_relative 'controller'
require_relative 'router'

csv_file = 'tasks.csv'
repository = Repository.new(csv_file)
controller = Controller.new(repository)
router = Router.new(controller)

router.run

