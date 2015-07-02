module HighriseInsightly
  class FileImport
    def initialize(file_list)
      @file_list = file_list
    end

    def perform
      @file_list.each do |file|
        #look for an organization first
        if !file.name.nil?
          contact = HighriseInsightly::Organization.fetch(file.name)
        end

        if contact.nil? && !file.name.nil?
          first_name, last_name = *file.name.split(' ', 2)
          contact = HighriseInsightly::Contact.fetch(file.email,
            first_name, last_name)
        end

        if !contact.nil?
          puts "Importing #{file.name}..."
          file.notes.each_with_index do |note, index|
            print " - Saving note #{index}..."
            result = contact.save_note(note)
            print result ? "Success" : "Failed"
            print "\n"
          end

          file.emails.each_with_index do |email, index|
            print " - Saving email #{index}..."
            result = contact.save_email(email)
            print result ? "Success" : "Failed"
            print "\n"
          end
        end

        sleep(0.1)
      end
    end
  end
end
