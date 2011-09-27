namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    50.times do
	    User.all(:limit => 6).each do |user|
	      user.microposts.create!(:content => Faker::Lorem.sentence(5), :expense => (1..50).to_a.sample, :tag => ["food", "phone", "home", "college", "gas"].to_a.sample)
	    end
    end

  end
end
