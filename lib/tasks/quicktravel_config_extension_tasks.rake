namespace :radiant do
  namespace :extensions do
    namespace :quicktravel_config do
      namespace :caches do
        namespace :clear do

          desc "Clears all caches"
          task :all => [:core, :other]


          desc "Clears core caches"
          task :core => :environment do
            Cache.clear_core_caches
          end


          desc "Clears other caches"
          task :other => :environment do
            Cache.clear_other_caches
          end

        end
      end


      desc "Copies public assets of the extension to the instance public/ directory."
      task :update => :environment do
        RadiantExtensionHelper.copy_assets(:quicktravel_config)
      end
    end
  end
end
