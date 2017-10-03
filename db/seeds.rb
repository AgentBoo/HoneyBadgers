# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'IronGloryInventory.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
        @badge = row.to_hash
#   puts @available = @badge['Available'].gsub(/\:|\d/,'')
#    puts @available = @badge['Available'].split(/\:|\D/)


    
    
  t = Badge.new
  t.product = row['Product']
  t.sku = row['SKU']
  t.price = row['Price']
  t.size = row['Available'].gsub(/\:|\d/, '')
  t.quantity = row['Available'].gsub(/\:|\D/, '')
  t.year = row['Year']
  t.description = row['Description']
  t.category = row['Category']
  t.save
  
#    
#  badge = { 1 => { featured: "true"}, 2 => {featured: "true"}}
#  Badge.update(badge.keys, badge.values)
    
end