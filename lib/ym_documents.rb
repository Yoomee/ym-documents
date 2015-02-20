require "ym_documents/engine"
require 'dragonfly'
require 'friendly_id'

module YmDocuments
   def self.config(&block)
    yield Engine.config if block
    Engine.config
  end
end

Dir[File.dirname(__FILE__) + '/ym_documents/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/ym_documents/controllers/*.rb'].each {|file| require file }
