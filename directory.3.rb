
#Array of all the students

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty Array
  students = []
  #gets the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the Array
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
#because i want to be able to use the :names data elsewehere?

end


def print_header
puts "The students of Villains Academy"
puts "-------------"
end


def print(students)
      students.each do |student|
        name = student[:name].to_s
         puts " #{student[:name]} (#{student[:cohort]}cohort)" if name.length < 12
          end
        end



def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
