module Api::V1::Users::Operation
  class Register < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Api::V1::Users::Contract::Register)
    step Contract::Validate()
    step Contract::Persist()

    failure :to

    step :renderer_options

    def to(ctx, **)
      binding.pry
    end

    def renderer_options(ctx, **)
      binding.pry
      ctx[:renderer_options] = {
        class: {
          User: Api::V1::Users::Representer::Register
        }
      }
    end
  end
end
