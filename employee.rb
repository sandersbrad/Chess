require 'byebug'
class Employee
  attr_accessor :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    # debugger
    # # for each employee check if they're a Manager
    # # if so, get salary and bonus
    # # Darren bonus = sum of subordinates
    employees.inject(0) do |accum, employee|
      if employee.is_a?(Manager)
        accum + (employee.salary * multiplier) + employee.bonus(multiplier)
      else
        accum + employee.bonus(multiplier)
      end
    end
  end

  def add_employees(employees)
    @employees = employees
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
ned.add_employees([darren])
darren.add_employees([shawna, david])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
