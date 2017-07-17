
#Array of all the students
Months = %w(january february march april may june july august september october november december January February March April May June July August September October November December).to_a
def input_students

  puts "Please enter the names of the students".center(70, '*')
  puts "To finish, just hit return twice".center(70, '*')
  #create an empty Array
  students = []
  #gets the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do

    puts "Please enter your cohort"
    cohort = gets.chomp
    while !Months.include?(cohort)
    puts "Please enter a month name only, typed out in full, for example; November"
    cohort = gets.chomp
end
    puts "Please enter your hobbies".center(20)
    hobbies = gets.chomp
    puts "Please enter your country of birth".center(20)
    country_b = gets.chomp
    puts "Finally your height".center(20)
    height = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, country_b: country_b, height: height}
    puts "Now we have #{students.count} students".center(70, '*')
    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = gets.chomp
  end
  #return the array of students
  students
#because i want to be able to use the :names data elsewehere?

end


def print_header
puts "The students of Villains Academy".center(70, '*')
puts "-------------".center(70)
end


def print(students)
     counter = 0
     counter_2 = students.size
      while counter < counter_2
        puts "Name; #{students[counter][:name]} Cohort; #{students[counter][:cohort]} Hobbies; #{students[counter][:hobbies]}
        Country of Birth; #{students[counter][:country_b]} Height; #{students[counter][:height]}". center(70)
      counter += 1
    end
  end



def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(70, '*')
end

# Nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
