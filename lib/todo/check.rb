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