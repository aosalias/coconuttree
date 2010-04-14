# Course.first.update_attribute(:description, desc.gsub(/<a .*a>/, "<a href='/courses/1'>PADI Open Water Diver</a>" ))

#!/usr/bin/env ruby
write = File.open('/home/aosalias/rails/ctd/test/fixtures/courses.yml', 'w')


read = File.open("/home/aosalias/www/ctd/www.coconuttreedivers.com/rec/showcourse.php?id=1&naked=yes", 'r')
data = read.read

start = data.index('<h1>') + 4
endrange = data.index('</h1>')
real = data[start, endrange-start]
title = real.downcase.gsub(' ', '_' ) + ":"
write.puts(title)
write.puts('  id:  ' + '1' )
write.puts( '  title:  "' + real + '"')

start = data.index('Time:')
time = data[start, 100]
start = time.index('top') + 5
endrange = time.index('</tr>')
real = '  ' + time[start, endrange-start-6]
write.puts( '  time:  "' + real + '"')

start = data.index('Course Price:')
course_price = data[start, 120]
start = course_price.index('top') + 5
endrange = course_price.index('</tr>')
real = course_price[start, endrange-start-6]
write.puts( '  course_price:  "' + real + '"')

write.puts( '  book_price:  0')

start = data.index('Prerequisites:')
prereqs = data[start, 300]
start = prereqs.index('top') + 5
endrange = prereqs.index('</tr>')
real = prereqs[start, endrange-start-6]
write.puts( '  prereqs:  "' + real + '"')

start = data.index('<!-- End table formatter -->') + 28
endrange = data.index('<div id="lower">') - 1907
real = data[start, endrange-start]
write.puts( '  description:  "' + real + '"')


[2,3,5,6].each do |id|
  read = File.open("/home/aosalias/www/ctd/www.coconuttreedivers.com/rec/showcourse.php?id=#{ id }", 'r')
  data = read.read

  start = data.index('<h1>') + 4
  endrange = data.index('</h1>')
  real = data[start, endrange-start]
  title = real.downcase.gsub(' ', '_' ) + ":"
  write.puts(title)
  write.puts('  id:  ' + id.to_s )
  write.puts( '  title:  "' + real + '"')

  start = data.index('Time:')
  time = data[start, 100]
  start = time.index('top') + 5
  endrange = time.index('</tr>')
  real = '  ' + time[start, endrange-start-6]
  write.puts( '  time:  "' + real + '"')

  start = data.index('Course Price:')
  course_price = data[start, 120]
  start = course_price.index('top') + 5
  endrange = course_price.index('</tr>')
  real = course_price[start, endrange-start-6]
  write.puts( '  course_price:  "' + real + '"')

  start = data.index('Book Price:')
  book_price = data[start, 120]
  start = book_price.index('top') + 5
  endrange = book_price.index('</tr>')
  real = book_price[start, endrange-start-6]
  write.puts( '  book_price:  "' + real + '"')

  start = data.index('Prerequisites:')
  prereqs = data[start, 300]
  start = prereqs.index('top') + 5
  endrange = prereqs.index('</tr>')
  real = prereqs[start, endrange-start-6]
  write.puts( '  prereqs:  "' + real + '"')

  start = data.index('<!-- End table formatter -->') + 28
  endrange = data.index('<div id="lower">') - 1907
  real = data[start, endrange-start]
  write.puts( '  description:  "' + real + '"')
end

