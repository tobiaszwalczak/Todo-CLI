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