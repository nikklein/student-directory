@students = []

def interactive_menu
loop do
print_menu
process gets.chomp
end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def process selection
  case selection
when "1"
  input_students
when "2"
show_students
when "9"
  exit
else
  puts "I don't know what you meant, try again"
  end
end


def input_students
puts "Please enter the name of a student and a cohort.\nTo finish, just hit return twice."

name = gets.strip
puts "..and a cohort please"
cohort = gets.sub("\n", "")

while !name.empty? do
  cohort = :november if cohort.empty?
  @students << {name: name, cohort: cohort.downcase.to_sym, hobby: nil, COB: nil, height: nil, t_shirt_size: nil}
  @students.size > 1 ? (puts "Now we have #{@students.count} students") : (puts "Now we have #{@students.count} student")
  puts "Please enter a student's name or return twice to exit"
  name = gets.chomp
puts "..and a cohort please"
cohort = gets.chomp
  end
  end


def print_header
exit if @students.empty?
puts "The students of Villains Academy".center(50)
 puts "-------------".center(50)
end

def print
count = 0
while count < @students.size do
 puts "#{count + 1}. #{@students[count][:name]} (#{@students[count][:cohort]} cohort) hobby: #{@students[count][:hobby]}
country of birth: #{@students[count][:COB]}  height: #{@students[count][:height]} T-shirt size: #{@students[count][:t_shirt_size]}"
count += 1
end
end

def print_footer
puts
if @students.size > 1
puts "Overall, we have #{@students.count} great students"
elsif @students.size == 1
puts "Overall, we have 1 great student"
else
puts "We have no students"
end
puts
end


def typo
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
until stud_number.to_i <= @students.size and stud_number.to_i > 0 do
puts "Please enter a number not equal to '0' and less than #{@students.size}: "
  stud_number = gets.chomp.to_s
end

puts "Please enter one of the following: 'name', 'cohort', 'hobby', 'COB', 'height', 't_shirt_size'? "
key_choose = gets.chomp.to_s.to_sym

until @students[stud_number.to_i - 1].key?(key_choose) or key_choose == :exit do
puts "Please enter one of these words: 'name', 'cohort', 'hobby', 'COB', 'height', 't_shirt_size' or 'exit' to quit!"
key_choose = gets.chomp.to_s.to_sym
end
exit if key_choose == :exit
puts "Please enter a #{key_choose.to_s} correctly"
change_info = gets.chomp.to_s
@students[stud_number.to_i - 1].map{|k,v| key_choose == :cohort ? @students[stud_number.to_i - 1][key_choose] = change_info.to_sym : @students[stud_number.to_i - 1][key_choose] = change_info}

print_header
print
print_footer
typo
end

def print_by_cohort
cohorts = []
@students.each{|x| cohorts << x[:cohort]}
uniq_cohorts = cohorts.uniq.sort
until uniq_cohorts.empty?
cohort_name = uniq_cohorts.shift.to_s
uniq_cohorts.compact
puts "#{cohort_name.capitalize} cohort students:"
@students.each{|k| puts "#{k[:name]}" if k[:cohort] == cohort_name.to_sym}
puts
end

end

interactive_menu
#students = input_students
print_header
#print_by_cohort
print #students
print_footer
#typo students
