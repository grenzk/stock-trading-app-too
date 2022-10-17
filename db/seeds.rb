puts "\n== Seeding the database with fixtures =="
system('bin/rails db:fixtures:load')

TransactionType.create([{ name: 'buy' }, { name: 'sell' }])
