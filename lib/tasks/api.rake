namespace :api do
  namespace :doc do
    desc 'Generate API documentation markdown'
    task :md do
      require 'rspec/core/rake_task'

      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.pattern = 'spec/requests/api/v1/'
        t.rspec_opts = "-f Dox::Formatter --order defined --tag dox --out public/api/docs/v1/apispec.md"
      end

      Rake::Task['api_spec'].invoke
    end

    task html: :md do
      `aglio -i public/api/docs/v1/apispec.md -o public/api/docs/v1/index.html`
    end

    task generate: ['api:doc:md', 'api:doc:html']
  end
end
