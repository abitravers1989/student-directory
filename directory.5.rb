
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
    puts "Please enter your hobbies"
    hobbies = gets.chomp
    puts "Please enter your country of birth"
    country_b = gets.chomp
    puts "Finally your height"
    height = gets.chomp
    students << {name: name, cohort: :november, hobbies: hobbies, country_b: country_b, height: height}
    puts "now we have #{students.count} students"
    #get another name from the user
    puts "Please enter another name, or double enter to end."
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
     counter = 0
     counter_2 = students.size
      while counter < counter_2
        puts "Name; #{students[counter][:name]} Cohort; #{students[counter][:cohort]} Hobbies; #{students[counter][:hobbies]}
        Country of Birth; #{students[counter][:country_b]} Height; #{students[counter][:height]}"
      counter += 1
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
