module Api::V1::Users::Representer
  class Register < JSONAPI::Serializable::Resource
    type 'users'

    attributes :email
  end
end
