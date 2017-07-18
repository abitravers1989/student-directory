@students = []
#Array of all the cohort months



def input_students
@months = %w(january february, march april may june july august september october november december January February March April May June July August September October November December)

  puts "Please enter the names of the students".center(70, '*')
  puts "To finish, just hit return twice".center(70, '*')

  #gets the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do


    puts "Please enter your cohort. Press enter twice when You have done so."
    cohort = gets.chomp
    if !@months.include?(cohort)
    puts "Please enter a month name only, typed out in full, for example; November"
    cohort = gets.chomp
  end
  if !@months.to_a.include?(cohort) || cohort == "\n"
    cohort = cohort.gsub(/\A[a-z\d]*\Z/i, "November").to_sym
  end
    puts "Please enter your hobbies"
    hobbies = gets.chomp
    puts "Please enter your country of birth"
    country_b = gets.chomp
    puts "Finally your height"
   height = gets.chomp
    @students << {name: name, cohort: cohort , hobbies: hobbies, country_b: country_b, height: height}

    x = @students.count
    puts "Now we have #{x}" " #{x==1 ? "student" : "students"}".center(70, '*')

    #get another name from the user
    puts "Please enter another name, or double enter to end.".center(70, '*')
    name = gets.chomp
  end

p @students

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

h = @students.sort_by {|x| x[:cohort]}.selct {|x| puts "Name #{x[:name]} : #{x[:cohort]}"}
counter = 0
counter_2 = @students.count
while counter < counter_2
  h.map do |key, value|
        puts "Cohort: #{key}:"
            @students.each do |u|
              puts "#{u[:name]}" if  (value[counter][:cohort] == key

      counter += 1
  break
end
        #puts "Name; #{student[:name]} Cohort; #{student[:cohort]}". center(70)



def print_footer

  x = @students.count
  if x >= 1
  puts "Overall, we have #{x} great students".center(70, '*')
elsif x <= 0
  puts "No Students :-(".center(70)
end

end


interactive_menu
