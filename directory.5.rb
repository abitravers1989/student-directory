@students = []

def creating_array_of_students(name, cohort)
    @students << {name: name, cohort: cohort}
end


def print_menu
   puts "1. Input the students"
   puts "2. Show the students"
   puts "3. Save the list to students.csv"
   puts "4. Load the list from students.csv"
   puts "9. Exit"
end


def interactive_menu
   loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


def process(selection)
  case selection
    when "1"
      input_students
     when "2"
        show_students
     when "3"
        save_students
     when "4"
        load_students
     when "9"
        exit #this will cause programe to terminate
     else
        puts "No se a lo que te refieres. I am unable to comprehend your command"
  end
end


def input_students
months = %w(january february, march april may june july august september october november december January February March April May June July August September October November December)

  puts "Please enter the names of the students".center(70, '*')
  puts "To finish, just hit return twice".center(70, '*')
@students = []
  #gets the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
while !name.empty?
    puts "Please enter your cohort. Press enter twice when You have done so."
    cohort = STDIN.gets.chomp
    if !months.include?(cohort)
    puts "Please enter a month name only, typed out in full, for example; November"
    cohort = STDIN.gets.chomp
  end
  if !months.to_a.include?(cohort) || cohort == "\n"
    cohort = cohort.gsub(/\A[a-z\d]*\Z/i, "November").to_sym
  end
    puts "Please enter your hobbies"
    hobbies = STDIN.gets.chomp
    puts "Please enter your country of birth"
    country_b = STDIN.gets.chomp
    puts "Finally your height"
   height = STDIN.gets.chomp
#######it breaks the cutout of the loop ... so double return no longer works
creating_array_of_students(name, cohort)


    x = @students.count
    puts "Now we have #{x}" " #{x==1 ? "student" : "students"}".center(70, '*')

    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = STDIN.gets.chomp
end


end


def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end



def print_header
puts "The students of Villains Academy".center(70, '*')
puts "-------------".center(70)

end


def print_students_list(h)
h = h.group_by {|x| x[:cohort]}.values
    h.each do |student|
      student.each_with_index do |y, index|
        puts "#{index}: #{y[:name]} Cohort #{y[:cohort]}"
      end
    end
end


def print_footer(students)
  students = @students
  x = @students.count
  if x >= 1
  puts "Overall, we have #{x} great students".center(70, '*')
elsif x <= 0
  puts "No Students :-(".center(70)
end

end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Thank you, your list has been created and it is a goodun!"
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do | line |
      name, cohort = line.chomp.split(',')
creating_array_of_students(name, cohort)
    end
  file.close
  puts "#{filename} has been opened :-)"
end



def try_load_students
  filename = ARGV.first
  return load_students("students.csv") if filename.nil?
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
end
end


try_load_students
interactive_menu
