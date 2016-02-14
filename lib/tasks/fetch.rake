
namespace :fetch do
  task stackoverflow: [:environment] do
    Fetchers::Stackoverflow.run
  end


  task :run do

  end
end
