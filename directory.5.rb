@students = []
#Array of all the cohort months

#DOES THE ORDERING OF THESE METHODS MATTER ? (google when have internet)

def initilizer
@name = name
@cohort = cohort
end


def creating_array_of_students
    @students << {name: @name, cohort: @cohort}
end


def print_menu
  #1. print the menu and ask user what to do
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
     #input the students
     input_students
     when "2"
     #show the students
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

  #gets the first name
  @name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
while !@name == "Exit" || !@name == "exit"

    puts "Please enter your cohort. Press enter twice when You have done so."
    @cohort = STDIN.gets.chomp
    if !months.include?(@cohort)
    puts "Please enter a month name only, typed out in full, for example; November"
    @cohort = STDIN.gets.chomp
  end
  if !months.to_a.include?(@cohort) || @cohort == "\n"
    @cohort = @cohort.gsub(/\A[a-z\d]*\Z/i, "November").to_sym
  end
    puts "Please enter your hobbies"
    hobbies = STDIN.gets.chomp
    puts "Please enter your country of birth"
    country_b = STDIN.gets.chomp
    puts "Finally your height"
   height = STDIN.gets.chomp
#######it breaks the cutout of the loop ... so double return no longer works
creating_array_of_students


    x = @students.count
    puts "Now we have #{x}" " #{x==1 ? "student" : "students"}".center(70, '*')

    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = STDIN.gets.chomp
end


end


def show_students
  print_header
  print_students_list
  print_footer
end



def print_header
puts "The students of Villains Academy".center(70, '*')
puts "-------------".center(70)

end


def print_students_list
=begin
CANNOT WORK 8 out so putting this back to orignal code for now and moving on.
Attempt1:
h = @students.group_by {|x| x[:cohort]}
counter = 0
counter_2 = @students.count
while counter < counter_2
  h.map do |key, value|
        puts "Cohort: #{key}:"
            @students.each do |u|
              puts "#{u[counter][:name]}" if  (value[counter][:cohort] == key

      counter += 1
  break
end
end
Attempt2:
h = @students.sort_by {|x| x[:cohort]}
h.select {|y| puts "Name #{y[:cohort]} : #{y[:name]}"}

=end

  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer

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
end

  def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do | line |
      @name, @cohort = line.chomp.split (',')

creating_array_of_students

    end
  file.close
end


def try_load_students
  filename = ARGV.first #the first argument from the command line
  return if filename.nil? #get out of this method if it isn't given
  if File.exists?(filename) #IF IT EXITS DO
    load_students(filename)
    puts "loaded #{@student.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
