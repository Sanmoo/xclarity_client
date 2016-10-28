module XClarityClient
  class Chassi
    BASE_URI = '/chassis'.freeze

    attr_accessor :properties, :_id, :accessState, :activationKeys, :activeAlerts, :backedBy, :bladeSlots,
    :cmmDisplayName, :cmmHealthState, :cmms, :cmmSlots, :complex, :contact, :dataHandle,
    :description, :domainName, :encapsulation, :energyPolicies, :errorFields,
    :excludedHealthState, :fanMuxes, :fanMuxSlots, :fans, :fanSlots, :height, :hostname,
    :isConnectionTrusted, :ledCardSlots, :leds, :location, :machineType, :managerName,
    :managerUuid, :manufacturer, :manufacturerId, :mgmtProcIPaddress, :model, :name,
    :nist, :nodes, :partNumber, :passThroughModules, :posID, :powerAllocation,
    :powerSupplySlots, :powerSupplies, :productId, :overallHealthState, :SecurityPolicy,
    :serialNumber, :status, :switches, :switchSlots, :tlsVersion, :type, :userDescription,
    :uri, :uuid, :vpdID, :mmSlots, :displayName, :productName, :parent, :fruNumber, :password, :recoveryPassword,
    :username, :managementPorts, :ipAddresses

    def initialize(attributes)
      build_chassi(attributes)
    end

    def build_chassi(attributes)
      attributes.each do |key, value|
        begin
          send("#{key}=", value)
        rescue
          $log.warn("UNEXISTING ATTRIBUTES FOR CHASSI: #{key}") unless Rails.nil?
        end
      end
    end
  end
end
