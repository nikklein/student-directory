def input_students
puts "Please enter the name of a student and a cohort.\nTo finish, just hit return twice."
# Country of Birth == COB
students = [
{name: "Dr.Hannibal Lecter", cohort: :november, hobby: "Humans eating",  COB: 'USA', height: '1.80',t_shirt_size: 'M'},
{name: "Darth Vader", cohort: :december, hobby: "Piloting a TIE", COB: 'Galaxy', height: '1.85',t_shirt_size: 'L'},
{name: "Nurse Ratched",cohort: :januar, hobby: "Acting like a tyrant", COB: 'USA', height: '1.65',t_shirt_size: 'M'},
{name: "Michael Corleone",cohort: :november, hobby: "Traveling to Sicily", COB: 'USA', height: '1.75',t_shirt_size: 'S'},
  ]

name = gets.chomp
puts "..and a cohort please"
cohort = gets.chomp

while !name.empty? do
  cohort = :november if cohort.empty?
  students << {name: name, cohort: cohort.downcase.to_sym, hobby: nil, COB: nil, height: nil, t_shirt_size: nil}
  puts "Now we have #{students.count} students "
  puts"Please enter a student's name or return twice to exit"
  name = gets.chomp
puts "..and a cohort please"
cohort = gets.chomp
  end
  students
  end

def print_header
 puts "The students of Villains Academy".center(50)
 puts "-------------".center(50)
end

def print students
count = 0
while count < students.size do
 puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort) hobby: #{students[count][:hobby]}
country of birth: #{students[count][:COB]}  height: #{students[count][:height]} T-shirt size: #{students[count][:t_shirt_size]}"
count += 1
end
end

def print_footer names
puts
puts "Overall, we have #{names.count} great students"
end


def typo students
puts
puts "If you made a typo you could fix it now, to do that please enter 'yes', otherwise enter 'no':"
overwrite = gets.chomp.downcase.to_s
until overwrite == 'yes' or overwrite == 'no' do
  puts "Plese enter 'yes' or 'no'"
  overwrite = gets.chomp.downcase.to_s
end

exit if overwrite == "no"

puts "Please enter a number from the numbered list of the students above:"
stud_number = gets.chomp.to_s
until stud_number.to_i <= students.size and stud_number.to_i > 0 do
puts "Please enter a number not equal to '0' and less than #{students.size}: "
  stud_number = gets.chomp.to_s
end

puts "Please enter one of the following: 'name', 'cohort', 'hobby', 'COB', 'height', 't_shirt_size'? "
key_choose = gets.chomp.to_s.to_sym

until students[stud_number.to_i - 1].key?(key_choose) or key_choose == :exit do
puts "Please enter one of these words: 'name', 'cohort', 'hobby', 'COB', 'height', 't_shirt_size' or 'exit' to quit!"
key_choose = gets.chomp.to_s.to_sym
end
exit if key_choose == :exit
puts "Please enter a #{key_choose.to_s} correctly"
change_info = gets.chomp.to_s
students[stud_number.to_i - 1].map{|k,v| key_choose == :cohort ? students[stud_number.to_i - 1][key_choose] = change_info.to_sym : students[stud_number.to_i - 1][key_choose] = change_info}

print_header
print students
print_footer students
puts
typo students
end

def print_by_cohorts students#, cohort
cohort = cohort.to_s.downcase.to_sym
students.sort_by{|k,v| k[:cohort]}.each{|c| puts "#{c[:name]} - #{c[:cohort]} cohort".center(50)}# if students[i][:cohort] == cohort}
end

students = input_students
print_header
print_by_cohorts students#, 'december'
#print students
print_footer students
#typo students
