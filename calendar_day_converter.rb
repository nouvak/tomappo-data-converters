#!/usr/bin/env ruby
require 'date'
require 'scanf'

File.open("data/OUT_db_data_calendar_day.txt", "w") do |write_file|
  File.open("data/db_data_calendar_day.txt", "r").each_line do |line|
    data = line.strip.split(/,/)
    id, str_date, moon, str_sun_rise, str_sun_set = data.flatten
    date = Date.parse(str_date)
    date_unix_time = date.to_time.to_i * 1000
    sun_rise_hours, sun_rise_minutes = str_sun_rise.scanf("%d:%d").flatten
    sun_rise = sun_rise_hours * 60 + sun_rise_minutes
    sun_set_hours, sun_set_minutes = str_sun_set.scanf("%d:%d").flatten
    sun_set = sun_set_hours * 60 + sun_set_minutes
    output_line = sprintf("%s,%d,%s,%d,%d", id, date_unix_time, moon, sun_rise, sun_set)
    write_file.puts output_line
  end
end