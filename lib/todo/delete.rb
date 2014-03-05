def delete
  if File.exist?("TODO")
    File.delete("TODO")
    puts "  "+Rainbow("Deleted TODO list").green.bright()
  else
    error(:nofile)
  end
end