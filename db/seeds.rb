# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE categories AUTO_INCREMENT = 1')
['探索',
'ソート',
'木構造',
'動的計画法',
'グラフ',
'重み付きグラフ',
'整数論',
'累積和',
'bit'].each do |name|
  Category.create!(name: name)
end

