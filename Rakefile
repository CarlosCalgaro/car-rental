
desc 'Running unit tests'
task :test do 
    sh 'rspec'
end

task :run do 
    puts 'Running the tests ...'  
    sh 'rspec'
    puts 'Running the project ...'
    sh 'ruby ./main.rb'
end

task :default => :run