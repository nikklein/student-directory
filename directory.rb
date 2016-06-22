def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"

students = [
{name: "Dr. Hannibal Lecter", cohort: :november, hobby: "Humans eating",  origin: 'USA', height: 1.80,t_shirt_size: 'M'},
{name: "Darth Vader", cohort: :november, hobby: "Piloting a TIE", origin: 'Galaxy', height: 1.85,t_shirt_size: 'L'},
{name: "Nurse Ratched",cohort: :november, hobby: "Acting like a tyrant", origin: 'USA', height: 1.65,t_shirt_size: 'M'},
{name: "Michael Corleone",cohort: :november, hobby: "Traveling to Sicily", origin: 'USA', height: 1.75,t_shirt_size: 'S'},
  ]

name = gets.chomp

while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students "
    name = gets.chomp
  end
  students
  end

def print_header
 puts "The students of Villains Academy"
 puts "-------------"
end

def print students
count = 0
while count < students.size do
 puts "#{students[count][:name]} |#{students[count][:cohort]} cohort|hobby: #{students[count][:hobby]}|origin: #{students[count][:origin]}|height: #{students[count][:height]}|T-shirt size:#{students[count][:t_shirt_size]}|"
count += 1
end
end

def print_footer names
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print students
print_footer students
