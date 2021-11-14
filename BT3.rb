require "csv"
require 'pg'

begin_create_file = Time.now
headers = ["name","email", "phone","address","brith","profile"]
CSV.open('bt3.csv', "w") do |csv|
    csv << headers
    for i in 1..500000
        csv << [
            "Nguyen Duc Thinh" + " " +i.to_s,
            "thinhnguyen".downcase.gsub(' ','') + i.to_s + "@gmail.com",
            "005650166",
            "Đồng Tháp",
            "21/10/2000",
            "thinh thinh tthinh"
          ]
    end
end
end_create_file = Time.now

begin_read_file = Time.now
data = CSV.read("bt3.csv")
data.each { |record| p record }
end_read_file = Time.now

begin_import_file = Time.now
con = PG.connect(dbname:'bt3', user:'thinhtu')
  for csv in data
    con.exec("INSERT INTO (name,email,phone,address,brith,profile) 
              VALUES('#{csv[0]}','#{csv[1]}','#{csv[2]}','#{csv[3]}','#{csv[4]}','#{csv[5]}')")
  end
end_import_file = Time.now

puts "Creating file: #{end_create_file - begin_create_file}s"
puts "Reading file: #{end_read_file - begin_read_file}s"
puts "Importing file: #{end_import_file - begin_import_file}s"
puts "Reading & Importing file: #{end_import_file - begin_read_file}"