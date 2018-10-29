
class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
   @salary * multiplier
  end
end

class Manager < Employee

  attr_accessor :employees, :salary

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    @employees.inject(0) { |acc, employee| acc + employee.salary } * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
