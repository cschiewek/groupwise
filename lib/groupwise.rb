require 'savon'
require 'groupwise/version'

module Groupwise
  require 'groupwise/post_office_agent'

  def self.wsdl_version(version)
    version = version.tr('.','').to_i
    dir = File.expand_path('../../contrib/novell/GW*', __FILE__)
    versions = Dir[dir].map do |dir|    
      dir.match(/(?<=GW)([^\n\r]*)/).captures.first.to_i
    end
    versions.min{|a,b|  (version-a).abs <=> (version-b).abs }.to_s
  end
end
