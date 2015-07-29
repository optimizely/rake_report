require 'spec_helper'
require 'json'

describe RakeReport do
  DateFormat = "Date(%Y, %-m, %-d, %k, %M, %S, %L)"
  Times = [
    { start: Time.new(2015, 01, 01),
      finish: Time.new(2015, 02, 01) },
    { start: Time.new(2015, 02, 01),
      finish: Time.new(2015, 03, 01) }
  ]

  it 'has a version number' do
    expect(RakeReport::VERSION).not_to be nil
  end

  it 'adds times as expected' do
    RakeReport.add_time("label", "type", Times[0][:start], Times[0][:finish])
    RakeReport.add_time("label", "type", Times[1][:start], Times[1][:finish])
    expect(RakeReport.times[:rows]).to include({c:[{v:"label"},{v:"type"},{v:Times[0][:start].strftime(DateFormat)},{v:Times[0][:finish].strftime(DateFormat)}]})
    expect(RakeReport.times[:rows]).to include({c:[{v:"label"},{v:"type"},{v:Times[1][:start].strftime(DateFormat)},{v:Times[1][:finish].strftime(DateFormat)}]})
  end

  it 'output json matches DataTable schema' do
    expect(RakeReport.to_json).to match_schema("DataTable")
  end
end
