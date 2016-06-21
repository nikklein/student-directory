def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
  end

def print_header
 puts "The students of Villains Academy"
 puts "-------------"
end

def print students, letter
  students.each_with_index {|student, index|
puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if students[index][:name][0] == letter}
end

def print_footer names
puts "Overall, we have #{names.count} great students"
end



students = input_students
print_header
print students, 'A'
print_footer students
