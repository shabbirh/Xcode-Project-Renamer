require "xcode-project-renamer/version"

module Xcode
  module Project
    module Renamer
      
      class Rename
        
        def initialize
          @from, @to = ARGV
          @files, @allFiles = [], []
          check_arguments
        end
        
        def check_arguments
          raise "-> Usage: xcodeprojectrenamer oldname newname" if @from.nil? or @to.nil?
        end

        def rename!
          puts ""
          puts "Renaming from #{@from} to #{@to}"

          rename_files
          rename_contents
        end

        private
        def rename_files

          # Collect files
          Dir.glob("#{@from}/**/*.*").each { |file| @files << file }
          Dir.glob("#{@from}.xcodeproj/**/*.*").each { |file| @files << file }
          @files << @from                 if File.exists? @from
          @files << "#{@from}.xcodeproj"  if File.exists? @from

          # Rename
          @files.each { |file| rename(file) }

          # Done
          puts @files.empty? ? "-> Nothing to rename" : "Done."
          puts ""
        end

        def rename_contents

          # Collect all files
          Dir.glob("#{@to}/**/*.*").each { |file| @allFiles << file }
          Dir.glob("#{@to}.xcodeproj/**/*.*").each { |file| @allFiles << file }

          # Replace @from with @to
          @allFiles.each do |file|
            next if File.directory? file
            content = File.read file
            puts "Replacing #{@from} -> #{@to} in: #{file}"
            new_content = content.gsub @from, @to rescue next
            File.open(file, "w") { |new_file| new_file.puts new_content}
          end

          # Done
          puts "Done."
          puts ""
        end

        def rename old_name
          dirname   = File.dirname old_name
          basename  = File.basename old_name
          new_basename = basename.gsub @from, @to
          new_name  = "#{dirname}/#{new_basename}"

          puts "Renaming -> #{old_name} -> #{new_name}"
          File.rename old_name, new_name
        end
        
      end
      
    end
  end
end
