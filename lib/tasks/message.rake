namespace :message do
    desc "Delete all Messages"
    task :destroy_all => :environment do
        Message.destroy_all
        puts "Messages deleted successfully"
    end
end