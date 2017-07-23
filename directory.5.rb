@students = []

def creating_array_of_students(name, cohort, hobbies, country_b, height)
    @students << {name: name, cohort: cohort, hobbies: hobbies, country_b: country_b, height: height}
end


def interactive_selection_menu
loop do
   puts "1. Input the students"
   puts "2. Show the students"
   puts "3. Save the list of students"
   puts "4. Load the list of students"
   puts "9. Exit"
   process_after_user_selection(STDIN.gets.chomp)
 end
end


def process_after_user_selection(selection)
  case selection
    when "1"
      "You have selected 1, we will now go through the process to put students into our database."
      input_students_directly_in_interface
     when "2"
       "You have selected 2, here are the students currently in our database."
        show_students
     when "3"
       "You have selected 3, we will now save the students you have input to our database."
        save_students
     when "4"
       "You have selected 4, we will now show you the students in your database."
        load_students
     when "9"
        "You have selected 9, goodbye :-)"
        exit #this will cause programe to terminate
     else
        puts "No se a lo que te refieres. I am unable to comprehend your command"
  end
end


def input_students_directly_in_interface
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
creating_array_of_students(name, cohort, hobbies, country_b, height)


    x = @students.count
    puts "Now we have #{x}" " #{x==1 ? "student" : "students"}".center(70, '*')

    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = STDIN.gets.chomp
end

end


def show_students
  print_students_list(@students)
end



def print_students_list(h)
  puts "The students of Villains Academy".center(70, '*')
  puts "-------------".center(70)
    h = @students.group_by {|x| x[:cohort]}.values
          h.each do |student|
          student.each_with_index do |y, index|
          puts "#{index+1}. Name: #{y[:name]} Cohort: #{y[:cohort]}"
        end
    end
  x = @students.count
    if x > 1
      puts "Overall, we have #{x} great students".center(70, '*')
    elsif x == 1
      puts "Overall, we have #{x} special student".center(70, '*')
    else
      puts "No Students :-(".center(70)
    end
end


def save_students
  puts "Please put the name of the file you wish to save the students too. If you do
  not have one please use 'students.csv'. This is the default file we will use."
  filename = STDIN.gets.chomp
  filename = "students.csv" if filename.empty?
  file = File.open(filename, "w") do |file|
     @students.each do |student|
     student_data = [student[:name], student[:cohort], student[:hobbies], student [:country_b], student[:height]]
     file << student_data.join(",")
     end
   end
  puts "Thank you, your list has been created and it is a goodun!"
end

def load_students(filename = "students.csv")
  puts "We are loading the database of students. Please select a filename to load
  if you do not wish to continue with the students.csv file."
  filename = STDIN.gets.chomp
  filename = "students.csv" if filename.empty?
    file = File.open(filename, "r")
    file.readlines.each do | line |
      name, cohort, hobbies, country_b, height = line.chomp.split(',')
creating_array_of_students(name, cohort, hobbies, country_b, height)
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
interactive_selection_menu
