#!/usr/bin/env ruby
require 'date'
require 'scanf'

File.open("data/OUT_db_data_activity_for_calendar_day", "w") do |write_file|
  File.open("data/db_data_activity_for_calendar_day.txt", "r").each_line do |line|
    data = line.strip.split(/,/)
    id, day_id, activity_type, str_start, str_end = data.flatten
    start_hours, start_minutes = str_start.scanf("%d:%d").flatten
    activity_start = start_hours * 60 + start_minutes
    end_hours, end_minutes = str_end.scanf("%d:%d").flatten
    activity_end = end_hours * 60 + end_minutes
    output_line = sprintf("%s,%s,%s,%d,%d", id, day_id, activity_type, activity_start, activity_end)
    write_file.puts output_line
  end
end