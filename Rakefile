
desc 'Running unit tests'
task :test do 
    exec 'rspec'
end

desc "Execute Irb loaded with the lib"
task :irb do 
    exec 'irb -I . -r main.rb'
end

namespace :examples do
    
    desc "Run test example with the original file" 
    task :original do 
        exec 'ruby -I . -r original_car_rental.rb tests/original_test.rb'
    end

    desc "Run test example with the refactored file"
    task :refactored do 
        exec 'ruby -I . -r main.rb tests/refactored_test.rb'        
    end
end
task :default => :irb