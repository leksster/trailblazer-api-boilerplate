# frozen_string_literal: true

module JsonapiParsing
  extend ActiveSupport::Concern

  def deserialize
    Class.new(JSONAPI::Deserializable::Resource) do
      id
      type
      attributes
      has_one do |_rel, id, type, key|
        type = type.to_s.singularize.camelize
        { "#{key}_id".to_sym => id, "#{key}_type".to_sym => type }
      end
      has_many do |_rel, ids, types, key|
        key   = key.to_s.singularize
        types = types.map { |t| t.to_s.singularize.camelize }
        { "#{key}_ids".to_sym => ids, "#{key}_types".to_sym => types }
      end
    end
  end
end
