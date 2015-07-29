require 'json'
require 'rake'
require 'rake_report/version'
require 'rake_report/template'
require 'rake_report/override'

module RakeReport
  @@times ||= {
    cols: [{label: 'task', type: 'string'},
           {label: 'type', type: 'string'},
           {label: 'start', type: 'datetime'},
           {label: 'end', type: 'datetime'}],
    rows: []
  }

  class << self
    def html(filename='rake_report.html')
      at_exit do
        RakeReportTemplate.new(@@times).save(filename)
      end
    end

    def add_time(label, type, start, finish)
      @@times[:rows].push({c:[{v:label},
                              {v:type},
                              {v:start.strftime("Date(%Y, %-m, %-d, %k, %M, %S, %L)")},
                              {v:finish.strftime("Date(%Y, %-m, %-d, %k, %M, %S, %L)")}]})
    end

    def times
      @@times
    end

    def to_json
      JSON.generate(@@times)
    end
  end
end
