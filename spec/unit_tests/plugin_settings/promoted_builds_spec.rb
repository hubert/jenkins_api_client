require File.expand_path('../../spec_helper', __FILE__)

describe JenkinsApi::Client::PluginSettings::PromotedBuilds do
  describe '#configure' do
    context 'given a Nokogiri::XML::Document' do
      it 'skips configuration if name is missing' do
      end

      it 'configures plugin if given a name' do
        promoted_builds_settings = JenkinsApi::Client::PluginSettings::PromotedBuilds.new(name: 'foo promotion')
        promoted_builds_settings.configure(xml_doc=Nokogiri::XML("<?xml version=\"1.0\"?>\n<properties>\n</properties>\n"))

        expect(xml_doc.at_xpath('//properties/hudson.plugins.promoted__builds.JobPropertyImpl/activeProcessNames/string').content).to eql('foo promotion')
      end
    end
  end
end
