namespace :db do

  task :confirm do
    unless Rails.env.development? || Rails.env.test?
      confirm_token = rand(10**4).to_s(10)
      STDOUT.puts "Confirm [ACTION]? Enter '#{confirm_token}' to confirm:"
      input = STDIN.gets.chomp
      fail "Aborting [ACTION]. You entered #{input}" unless input == confirm_token
    end
  end

  task nuke: :confirm do
    puts 'NUKING DB...'
    Rake::Task['db:drop'].invoke
    puts 'Creating new DB...'
    Rake::Task['db:create'].invoke
    puts 'Executing Migrations...'
    Rake::Task['db:migrate'].invoke
    puts 'Dumping brand new schema.db...'
    Rake::Task['db:schema:dump'].invoke
    puts 'Setting up new database...'
    Rake::Task['db:seed'].invoke
    puts 'DONE!'
  end
end
