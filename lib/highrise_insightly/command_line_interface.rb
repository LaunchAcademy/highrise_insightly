require 'thor'

module HighriseInsightly
  class CommandLineInterface < Thor
    desc "import GLOB", "import highrise note files"
    def import(glob)
      begin
        require 'dotenv'
        Dotenv.load
      rescue
      end
      file_list = HighriseInsightly::Highrise::FileList.
        new(glob)

      import = HighriseInsightly::FileImport.
        new(file_list)
      import.perform
    end
  end
end

