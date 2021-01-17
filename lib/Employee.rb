require 'pry'

class Employee
    attr_reader :name
    attr_accessor :salary
    @@all_employees = []
    # #name: returns employees name. String DONE
    def initialize(name)
        @@all_employees << self
        @name = name
    end
    # #salary: returns employees salary. Fixnum DONE
    def salary=(salary)
        @salary = salary
    end

    # #manager_name: returns name of manager. String
    def manager_name
        Department.get_manager(self)
    end
    
    # Employee.all: returns all employees. Array
    def self.all
        @@all_employees
    end

    # Employee.paid_over: takes amount, returns all employess
    # # whos salary is over that amount
    def self.paid_over(amount)
        @@all_employees.select{|employee|
            employee.salary && employee.salary > amount
        }
    end

    # Employee.find_by_department: takes name of department
    # # returns first employee whose manager is working that department
    def self.find_by_department(dept_title)
        Department.first_employee_of_department(dept_title)
    end

    # #tax_bracket: return all employees whose salaries are within
    # # $1000 of the salary of the invoker
    def tax_bracket
        @@all_employees.select{|employee|
                upper_thresh = employee.salary + 1000
                lower_thresh = employee.salary - 1000
                self.salary <= upper_thresh && self.salary >= lower_thresh && employee != self
        }
    end

end
