def help
  puts "\n"
  puts "  $ todo #{Rainbow('[command]').blue.bright} #{Rainbow('[task]').green.bright}\n\n"
  puts "     #{Rainbow('show').blue.bright}        => Shows the TODO list"
  puts "   #{Rainbow('delete').blue.bright}        => Deletes the TODO list"
  puts "      #{Rainbow('add').blue.bright} #{Rainbow('[task]').green.bright} => Adds a task (creates file if not available)"
  puts "       #{Rainbow('rm').blue.bright} #{Rainbow('[task]').green.bright} => Removes a task (removes file when last task)"
  puts "    #{Rainbow('check').blue.bright} #{Rainbow('[task]').green.bright} => Markes a task as done"
  puts "  #{Rainbow('uncheck').blue.bright} #{Rainbow('[task]').green.bright} => Unmarks a task when already marked\n\n"
  puts "  Pro tip: You can match the task #{Rainbow('\'Do something\'').blue.bright} with #{Rainbow('\'Do...\'').blue.bright}"
  puts "\n"
end