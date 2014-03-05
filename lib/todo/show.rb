#encoding:utf-8

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