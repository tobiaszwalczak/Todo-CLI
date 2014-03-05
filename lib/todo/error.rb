def error (type)
  case type
    when :cmd 
      output = "Invalid command"
    when :task
      output = "You need to specify a task"
    when :nofile
      output = "There is no TODO file in this directory"
    when :notfound
      output = "The given task is not in your TODO list"
    when :alreadythere
      output = "The given task is already in your TODO list"
    when :alreadydone
      output = "The given task is already checked"
    when :notchecked
      output = "The given task is not checked"
  end
  
  puts "  "+Rainbow(output).red.bright()
  exit
end