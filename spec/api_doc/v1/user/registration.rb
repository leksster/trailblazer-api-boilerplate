module ApiDoc
  module V1
    module User
      module Registration
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Registration' do
            endpoint '/registration'
            group 'Registration'
          end

          group 'Registration' do
            desc 'Registration group'
          end
        end

        document :create do
          action 'Register new user'
        end
      end
    end
  end
end
