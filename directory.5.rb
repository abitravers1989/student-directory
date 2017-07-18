@students = []
#Array of all the cohort months
Months = %w(january february, march april may june july august september october november december January February March April May June July August September October November December).to_a


def input_students

  puts "Please enter the names of the students".center(70, '*')
  puts "To finish, just hit return twice".center(70, '*')

  #gets the first name
  name = gets.gsub("\n",'')
  #while the name is not empty, repeat this code
  while !name.empty? do

    puts "Please enter your cohort. Press enter twice when You have done so."
    cohort = gets.gsub("\n",'')
    puts "Please enter a month name only, typed out in full, for example; November" if !Months.include?(cohort)
    cohort = gets.chomp
    cohort = "November".to_sym if (!Months.include?(cohort) || cohort == "\n")


    puts "Please enter your hobbies".center(20)
    hobbies = gets.gsub("\n",'')

    puts "Please enter your country of birth".center(20)
    country_b = gets.gsub("\n",'')

    puts "Finally your height".center(20)
    height = gets.gsub("\n",'')

    @students << {name: name, cohort: cohort, hobbies: hobbies, country_b: country_b, height: height}

    x = @students.count
    puts "Now we have #{x}" " #{x==1 ? "student" : "students"}".center(70, '*')

    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = gets.gsub("\n",'')
  end

end


def interactive_menu
   loop do
    print_menu
    process(gets.chomp)
  end

end



def print_menu
  #1. print the menu and ask user what to do
   puts "1. Input the students"
   puts "2. Show the students"
   puts "9. Exit"
end



def show_students
  print_header
  print_students_list
  print_footer
end


def process(selection)

  case selection
    when "1"
     #input the students
     @students = input_students
     when "2"
     #show the students
     show_students
     when "9"
     exit #this will cause programe to terminate
     else
     puts "No se a lo que te refieres. I am unable to comprehend your command"
  end
end




def print_header
puts "The students of Villains Academy".center(70, '*')
puts "-------------".center(70)

end


def print_students_list
=begin ... STRUGGLING WITH THIS.. How to sort the students by cohort and retrun them this way
  check = "November"
  namez = :name.to_s
  cohortz = :cohort.to_s
  students.map {|hash| hash[namez] if check.include?(hash[cohortz])}.compact
=end

x = @students.count
    if x <= 0
        puts "Name; #{@students[:name]} Cohort; #{@students[:cohort]} Hobbies; #{@students[:hobbies]}
        Country of Birth; #{@students[:country_b]} Height; #{@students[:height]}". center(70)
    else
      puts "No Students :-(".center(70)
    end
  end



def print_footer

  puts "Overall, we have #{@students.count} great students".center(70, '*') if @students.size != 0

end

interactive_menu
