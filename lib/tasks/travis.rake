# Rake tasks to run multiple builds in Travis CI
namespace :travis do
  task test_all: [:spec]

  task :spec do
    Rake::Task['spec'].invoke
  end
end
