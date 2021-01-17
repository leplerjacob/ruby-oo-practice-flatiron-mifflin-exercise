require 'pry'

class Department
    attr_reader :title, :manager, :employees

    @@departments = []
    def initialize(title)
        @@departments << self
        @title = title
        @employees = []
    end

    def add_manager(manager)
        @manager = manager
    end

    def self.get_department(manager)
        @@departments.detect{|dept|
            dept.manager.name == manager.name
        }
    end

    def add_employees(*args)
        if args.length == 1
            @employees << args
        else
            args.each do |employee|
                if !@employees.include?
                    @employees << employee
                end
            end 
        end
        @employees.flatten!
    end

    def self.get_manager(employee)
        @@departments.select{|dept|
            if dept.employees.include?(employee)
                return dept.manager.name
            end
        }
        "#{employee.name} not found"
    end

    def self.all_titles
        @@departments.map{|dept|
            {:title => dept.title, :manager => dept.manager.name}
        }
    end

    def self.get_managed_employees(manager)
        @@departments.select{|dept|
            if dept.manager.name == manager.name
                return dept.employees
            end
        }
    end

    def self.first_employee_of_department(dept_title)
        @@departments.detect{|dept|
            if dept.title == dept_title
                return dept.employees[0]
            end
        }
    end
end
