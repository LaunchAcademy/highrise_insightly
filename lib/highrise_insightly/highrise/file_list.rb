module HighriseInsightly
  module Highrise
    class FileList
      include Enumerable

      def initialize(glob)
        @glob = glob
      end

      def [](index)
        files[index]
      end

      def each(&block)
        files.each(&block)
      end

      protected
      def files
        @files ||= Dir[@glob].map do |path|
          File.new(path)
        end
      end
    end
  end
end
