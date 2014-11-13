module JenkinsApi
  class Client
    module PluginSettings
      class PromotedBuilds < Base
        def initialize(params={})
          @params = params
        end

        def configure(xml_doc)
          xml_doc.tap do |doc|
            Nokogiri::XML::Builder.with(doc.at('properties')) do |properties|
              properties.send('hudson.plugins.promoted__builds.JobPropertyImpl') do |x|
                x.activeProcessNames do |xa|
                  xa.string @params.fetch(:name) { '' }
                end
              end
            end
          end
        end
      end
    end
  end
end
