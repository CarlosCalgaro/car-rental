
desc 'Running unit tests'
task :test do 
    exec 'rspec'
end

task :irb do 
    exec 'irb -I . -r main.rb'
end

namespace :examples do 
    task :original do 
        exec 'ruby -I . -r original_car_rental.rb tests/original_test.rb'
    end

    task :refactored do 
        exec 'ruby -I . -r main.rb tests/refactored_test.rb'        
    end
end
task :default => :irb