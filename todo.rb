#!/usr/bin/ruby
#encoding:utf-8

require "rainbow"

cmd = ARGV[0]
arg = ARGV[1]

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

def show
  error(:nofile) unless File.exist?("TODO")

  puts Rainbow("\n  Your TODO list:").blue.bright()+" (#{Dir.pwd}/TODO)\n\n"

  File.read("TODO").each_line do |line|
    if line[0,1] == "#"
      line.sub!("#", "")
      line.sub!("\n", "")
      puts "  » "+ Rainbow(line +" ✔").green.bright
    else
      puts "  » "+ line
    end 
  end

  puts "\n"
end

def delete
  if File.exist?("TODO")
    File.delete("TODO")
    puts "  "+Rainbow("Deleted TODO list").green.bright()
  else
    error(:nofile)
  end

end

def add (task)
  if File.exist?("TODO")
    content = File.read("TODO")

    if content[task]
      error(:alreadythere)
    end
  end

  File.open("TODO", "a") do |file|
    file.puts(task)
  end

  puts "  "+Rainbow("Added").green.bright()+" => "+Rainbow(task).blue.bright()
end

def remove (task)
  content = File.read("TODO")
  
  if task["..."]
    pattern = task.chomp("...")
    if content =~ /\##{pattern}(.*)\n/
      content.gsub!(/\##{pattern}(.*)\n/, "")
    elsif content =~ /#{pattern}(.*)\n/
      content.gsub!(/#{pattern}(.*)\n/, "")
    else
      error(:notfound)
    end
    output = pattern + $1
  else
    if content =~ /\##{task}\n/
      content.sub!("\##{task}\n", "")
    elsif content =~ /#{task}\n/
      content.sub!("#{task}\n", "")
    else
      error(:notfound)
    end
    output = task
  end
  File.write("TODO", content)
  puts "  "+Rainbow("Removed").green.bright()+" => "+Rainbow(output).blue.bright()
  File.delete("TODO") if content == ""
end

def check (task)
  content = File.read("TODO")
  
  if task["..."]
    pattern = task.chomp("...")
    if content =~ /\##{pattern}(.*)\n/
      error(:alreadydone)
    elsif content =~ /#{pattern}(.*)\n/
      content.gsub!(/#{pattern}(.*)\n/, "##{pattern}#{$1}\n")
    else
      error(:notfound)
    end
    output = pattern + $1
  else
    if content =~ /\##{task}\n/
      error(:alreadydone)
    elsif content =~ /#{task}\n/
      content.sub!("#{task}\n", "##{task}\n")
    else
      error(:notfound)
    end
    output = task
  end

  File.write("TODO", content)
  puts "  "+Rainbow("Checked").green.bright()+" => "+Rainbow(output).blue.bright()
end

def uncheck (task)
  content = File.read("TODO")
  
  if task["..."]
    pattern = task.chomp("...")
    if content =~ /\##{pattern}(.*)\n/
      content.gsub!(/##{pattern}(.*)\n/, "#{pattern}#{$1}\n")
    elsif content =~ /#{pattern}(.*)\n/
      error(:notchecked)
    else
      error(:notfound)
    end
    output = pattern + $1
  else
    if content =~ /\##{task}\n/
      content.sub!("##{task}\n", "#{task}\n")
    elsif content =~ /#{task}\n/
      error(:notchecked)
    else
      error(:notfound)
    end
    output = task
  end

  File.write("TODO", content)
  puts "  "+Rainbow("Unchecked").green.bright()+" => "+Rainbow(output).blue.bright()
end

case cmd
  when nil, "help", "h", "?"
    help
  when "status", "show", "s"
    show
  when "delete", "del", "d"
    delete
  when "add", "a", "+"
    error(:task) if arg.nil?
    add(arg)
  when "remove", "rm", "r", "-"
    error(:task) if arg.nil?
    remove(arg)
  when "check", "c"
    error(:task) if arg.nil?
    check(arg)
  when "uncheck", "uc"
    error(:task) if arg.nil?
    uncheck(arg)
  else
    error(:cmd)
end