namespace :spree do
  namespace :extensions do
    namespace :highlight_products do
      desc "Copies public assets of the highlight products extension to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[HighlightProductsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(HighlightProductsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end