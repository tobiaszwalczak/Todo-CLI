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