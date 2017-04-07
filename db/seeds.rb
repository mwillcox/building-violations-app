require 'csv'

# parses csv and stores Violation object in db
violations_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Violations-2012.csv'))
violations_csv = CSV.parse(violations_csv_text, :headers => true, :encoding => 'ISO-8859-1')
violations_csv.each do |row|
  v = Violation.new
  v.category = row['violation_category']
  v.date = row['violation_date']
  v.date_closed = row['violation_date_closed']
  v.save
end
puts "There are now #{Violation.count} rows in the violation table"

