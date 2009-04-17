# Rakefile

dot_files = FileList["dot_files/*"]
root = File.dirname(__FILE__)

task :default => :setup

desc "setup dot files"
task :setup do
  dot_files.each do |file|
    link_name = File.basename(file).sub(/^dot/, '')
    begin
      sh "rm -rf ~/#{link_name}"
      sh "ln -s #{root}/#{file} ~/#{link_name}"
    rescue => ex
    end
  end
end
