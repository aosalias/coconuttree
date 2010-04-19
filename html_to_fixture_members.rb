# Course.first.update_attribute(:description, desc.gsub(/<a .*a>/, "<a href='/courses/1'>PADI Open Water Diver</a>" ))
require 'iconv'
require 'yaml'


#!/usr/bin/env ruby
write = File.open('/home/aosalias/rails/ctd/test/fixtures/members.yml', 'w')


read = File.open("/home/aosalias/www/ctd/www.coconuttreedivers.com/crew/index.php", 'r')
data = Iconv.conv('UTF-8', 'LATIN1', read.read)

members = {}
member = {}
endrange = 0
id = 0
while(id+=1) do
  member = {}
  member['id'] = id

  start = data.index(/(<a name=")(.*?)(\.jpg)">/i, endrange)
  endrange = data.index('"><', start)
  real = data[start+9, endrange-start-9]
  member['avatar_file_name'] = real

  start = data.index(/(<a name=")(.*?)(<\/div>)/i, endrange)
  start = data.index('</a>', start)
  endrange = data.index(/(<\/div>)/, start)
  real = data[start+4, endrange-start-4]

  key = real.downcase
  if key[-1] == 32 then key.slice!(-1) end
  key = key.gsub(' ', '_' ) + ":"

  member['name'] = real

  start = data.index(/(<b>)(.*?)(<\/b>)/i, endrange)
  endrange = data.index(/(<\/b>)/, start)
  real = data[start+3, endrange-start-3]
  member['title'] = real

  start = data.index(/(<b>)(.*?)(<\/b>)/i, endrange)
  endrange = data.index(/(<\/b>)/, start)
  real = data[start+3, endrange-start-3]
  member['country'] = real

  start = data.index('</div>', endrange)
  endrange = data.index('</div>', start+5)
  real = data[start+7, endrange-start-8]
  member['description'] = real

  member['position'] = case id
    when 1...4 then 'manager'
    when 4...6 then 'captain'
    when 6...14 then 'dive_staff'
    when 14...21 then 'support'
    when 21...24 then 'student'
    else 'grad'
  end

  members[key] = member

  break if key == "chucky:"
end

while(id+=1) do
  member = {}
  member['id'] = id

  start = data.index(/(<a name=")(.*?)(\.jpg)">/i, endrange)
  endrange = data.index('"><', start)
  real = data[start+9, endrange-start-9]
  member['avatar_file_name'] = real

  start = data.index(/(<div class="caption")(.*?)(<\/div>)/i, endrange)
  endrange = data.index(/(<\/b>)/, start)
  real = data[start+24, endrange-start-24]
  key = real.downcase.gsub(' ', '_' ) + ":"
  member['name'] = real

  member['title'] = 'Divemaster Trainee'

  start = data.index(/(<br \/>)(.*?)(<\/div>)/i, endrange)
  endrange = data.index(/(<\/div>)/, start)
  real = data[start+6, endrange-start-6]
  member['country'] = real
  member['position'] = 'student'

  members[key] = member
  break if key == "aly_wilson:"
end


write.puts members.to_yaml
write.close
