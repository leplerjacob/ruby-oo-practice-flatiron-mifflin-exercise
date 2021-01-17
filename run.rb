require_relative "lib/Manager"
require_relative "lib/Employee"
require_relative "lib/Department"
require 'pry'

# Initialize Departments
research, sales = [Department.new("Research"), Department.new("Sales")]

# Initialize Managers
bezos = Manager.new("Jeff Bezos")
bezos.age = 50
bezos.department = "Sales"
sales.add_manager(bezos)
elon = Manager.new("Elon Musk")
elon.age = 48
elon.department = "Research"
research.add_manager(elon)

bezos.hire_employee("Alex Petri", 103_000)
elon.hire_employee("Jonathan McDaniels", 75_000)
elon.hire_employee("Melissa Jenkins", 102_000)

(alex,jonathan,melissa) = Employee.all


# Retrieves department of invoker
bezos.department
# Retrieves manager of invoker
melissa.manager_name
# Retrieves all existing departments
Manager.all_departments
# Retrieves average age of all managers
Manager.average_age
# Retrieves all employees of invoker
bezos.employees
# Retrieves all employees paid over given amount
Employee.paid_over(45_000)

binding.pry
puts "done"
