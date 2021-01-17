require 'pry'

class Manager
    # #age: returns age of manager. Fixnum
    attr_accessor :age
    # #name: returns name. String
    attr_reader :name

    @@managers = []

    def initialize(name)
        @name = name
        @@managers << self
    end

    def department=(title)
        @department = title
    end

    # #department: returns department name. String
    def department
        Department.get_department(self)
    end

    #### Manager
    # Manager.all: returns all managers. Array
    def self.all
        @@managers
    end
    # Manager.all_departments: returns all department names
    # # and managers. Array
    def self.all_departments
        # Later add ability to retrieve managers without a department and departments without a manager
        Department.all_titles
    end
    # Manager.average_age: returns average age of managers. Float
    def self.average_age
        @@managers.sum(0.0){|manager|
            manager.age
        } / @@managers.length
    end
    
    #### Department
    # #employees: returns employees of manager. Array
    def employees
        Department.get_managed_employees(self)
    end

    # #hire_employee: takes (employee name, salary), adds to list of employees
    def hire_employee(employee, salary)
        new_employee = Employee.new(employee)
        new_employee.salary = salary
        self.department.add_employees(new_employee)
    end
    # # returns list of employees of manager. Array



end
