# Course.first.update_attribute(:description, desc.gsub(/<a .*a>/, "<a href='/courses/1'>PADI Open Water Diver</a>" ))
require 'iconv'
require 'yaml'


#!/usr/bin/env ruby
write = File.open('/home/aosalias/rails/ctd/test/fixtures/courses.yml', 'w')


read = File.open("/home/aosalias/www/ctd/www.coconuttreedivers.com/rec/showcourse.php?id=1&naked=yes", 'r')
data = Iconv.conv('UTF-8', 'LATIN1', read.read)

courses = {}
course = {}

start = data.index('<h1>') + 4
endrange = data.index('</h1>')
real = data[start, endrange-start]
title = real.downcase.gsub(' ', '_' ) + ":"

#write.puts(title)
#write.puts('  id:  ' + '1' )
course['id'] = 1
#write.puts( '  title:  "' + real + '"')
course['title'] = real
start = data.index('Time:')
time = data[start, 100]
start = time.index('top') + 5
endrange = time.index('</tr>')
real = '  ' + time[start, endrange-start-6]
#write.puts( '  time:  "' + real + '"')
course['time'] = real

start = data.index('Course Price:')
course_price = data[start, 120]
start = course_price.index('top') + 5
endrange = course_price.index('</tr>')
real = course_price[start, endrange-start-6]
#write.puts( '  course_price:  "' + real + '"')
course['course_price'] = real

#write.puts( '  book_price:  0')
course['book_price'] = '0'

start = data.index('Prerequisites:')
prereqs = data[start, 300]
start = prereqs.index('top') + 5
endrange = prereqs.index('</tr>')
real = prereqs[start, endrange-start-6]
#write.puts( '  prereqs:  "' + real + '"')
course['prereqs'] = real

#write.puts( '  image_path:  "dsd_big.jpg"')
course['image_path'] = 'dsd_big.jpg'

start = data.index('') + 28
endrange = data.index('<div id="lower">') - 1907
real = data[start, endrange-start]
#write.puts( '  description:  "' + real + '"')
course['description'] = real

courses[title] = course
course = {}

['rec', 'pro', 'tec', 'spec'].each do |path|
  (1..20).each do |id|
    data = nil
    begin
      read = File.open("/home/aosalias/www/ctd/www.coconuttreedivers.com/#{ path }/showcourse.php?id=#{ id }", 'r')
      data = Iconv.conv('UTF-8', 'LATIN1', read.read)
    rescue
      nil
    end
    if data
      start = data.index('<h1>') + 4
      endrange = data.index('</h1>')
      real = data[start, endrange-start]
      title = real.downcase.gsub(' ', '_' ) + ":"
#      write.puts(title)
#      write.puts('  id:  ' + id.to_s )
#      write.puts( '  title:  "' + real + '"')
      course['id'] = id.to_s
      course['title'] = real

      start = data.index('Time:')
      time = data[start, 150]
      start = time.index('top') + 5
      endrange = time.index('</tr>')
      puts id
      real = '  ' + time[start, endrange-start-6]
#      write.puts( '  time:  "' + real + '"')
      course['time'] = real

      start = data.index('Course Price:')
      course_price = data[start, 120]
      start = course_price.index('top') + 5
      endrange = course_price.index('</tr>')
      real = course_price[start, endrange-start-6]
#      write.puts( '  course_price:  "' + real + '"')
      course['course_price'] = real

      start = data.index('Book Price:')
      if start
        book_price = data[start, 120]
        start = book_price.index('top') + 5
        endrange = book_price.index('</tr>')
        real = book_price[start, endrange-start-6]
#        write.puts( '  book_price:  "' + real + '"')
        course['book_price'] = real

      end

      start = data.index('Prerequisites:')
      prereqs = data[start, 450]
      start = prereqs.index('top') + 5
      endrange = prereqs.index('</tr>')
      real = prereqs[start, endrange-start-6]
#      write.puts( '  prereqs:  "' + real + '"')
      course['prereqs'] = real

      image_path = case id
        when 2 then "ow_big.jpg"
        when 3 then "aow_big.jpg"
        when 5 then "efr_big.jpg"
        when 6 then "resc_big.jpg"
        when 7 then "dm_big.jpg"
        when 14 then "ai_big.jpg"
        when 15 then "owsi_big.jpg"
        when 16 then "msdt_big.jpg"
        when 17 then "idcs_big.jpg"
        when 18 then "tec_big.jpg"
        when 19 then "tec_big.jpg"
        when 20 then "tec_big.jpg"
        when 4 then "eanx_big.jpg"
        when 8 then "wrck_big.jpg"
        when 9 then "nav_big.jpg"
        when 10 then "foto_big.jpg"
        when 11 then "ppb_big.jpg"
        when 12 then "deep_big.jpg"
        else 'foo'
      end
#      write.puts( '  image_path:  "' + image_path + '"')
      course['image_path'] = image_path

      start = data.index('') + 28
      endrange = data.index('<div id="lower">') - 1907
      real = data[start, endrange-start]
#      write.puts( ('  description:  "' + real.gsub(//n/r/, "/n  ") + '"'))
      course['description'] = real

      courses[title] = course
      course = {}
    end
  end
end

write.puts courses.to_yaml
write.close
