class Todo
	def initialize (cmd, arg)
		@cmd = cmd
		@arg = arg
	end

	def start
		case @cmd
		  when nil, "help", "h", "?"
		    help
		  when "status", "show", "s"
		    show
		  when "delete", "del", "d"
		    delete
		  when "add", "a", "+"
		    error(:task) if @arg.nil?
		    add(@arg)
		  when "remove", "rm", "r", "-"
		    error(:task) if @arg.nil?
		    remove(@arg)
		  when "check", "c"
		    error(:task) if @arg.nil?
		    check(@arg)
		  when "uncheck", "uc"
		    error(:task) if @arg.nil?
		    uncheck(@arg)
		  else
		    error(:cmd)
		end
	end

	require "todo/help"
	require "todo/error"
	require "todo/show"
	require "todo/delete"
	require "todo/add"
	require "todo/remove"
	require "todo/check"
	require "todo/uncheck"
end