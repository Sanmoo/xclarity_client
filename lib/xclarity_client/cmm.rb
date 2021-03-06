require "pp"

module XClarityClient
  class Cmm
    include XClarityClient::Resource

    BASE_URI = '/cmms'.freeze
    LIST_NAME = 'cmmList'.freeze

    attr_accessor :accessState, :backedBy, :cmmDisplayName, :cmmHealthState, :dataHandle, :description,
                  :dnsHostnames, :domainName, :errorFields, :excludedHealthState, :firmware, :FRU,
                  :fruSerialNumber, :hostConfig, :hostname, :ipInterfaces, :ipv4Addresses, :ipv6Addresses,
                  :leds, :macAddresses, :machineType, :manufacturer, :manufacturerId, :mgmtProcIPaddress,
                  :model, :name, :overallHealthState, :parent, :partNumber, :powerAllocation, :productId,
                  :role, :serialNumber, :slots, :type, :uri, :userDescription, :uuid

    def initialize(attributes)
      build_resource(attributes)
    end
  end
end
