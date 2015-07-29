module Rake
  class Task
    def execute_with_time(*args)
      start = Time.now
      execute_without_time(*args)
      finish = Time.now
      RakeReport.add_time(name, 'execute', start, finish)
    end

    def invoke_with_time(*args)
      start = Time.now
      invoke_without_time(*args)
      finish = Time.now
      RakeReport.add_time(name, 'invoke', start, finish)
    end

    alias :execute_without_time :execute
    alias :execute :execute_with_time
    alias :invoke_without_time :invoke
    alias :invoke :invoke_with_time
  end
end
