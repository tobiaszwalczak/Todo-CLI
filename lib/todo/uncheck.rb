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