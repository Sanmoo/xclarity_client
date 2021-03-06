require 'json'

module XClarityClient
  class UnmanageRequestManagement < XClarityBase

    include XClarityClient::ManagementMixin

    def initialize(conf)
      @conf = conf
      super(conf, UnmanageRequest::BASE_URI)
    end

    def unmanage_discovered_devices(endpoints, force)
      deploy_hash = {}
      deploy_hash.merge!({:endpoints => endpoints})  
      if force.downcase.eql? "true"
        deploy_hash.merge!({:forceUnmanage => true})
      else
         deploy_hash.merge!({:forceUnmanage => false})
      end
      response = do_post(UnmanageRequest::BASE_URI, JSON.generate(deploy_hash))
      if response.status == 200 or response.status == 201
        puts response.headers[:location].split("/")[-1]
      end
    end

    def fetch_unmanage_request(job_id)
      response = connection(UnmanageRequest::BASE_URI + "/jobs/" + job_id)
      return [] unless response.success?

      body = JSON.parse(response.body)

      body = {UnmanageRequest::LIST_NAME => body} if body.is_a? Array
      body = {UnmanageRequest::LIST_NAME => [body]} unless body.has_key? UnmanageRequest::LIST_NAME
      body[UnmanageRequest::LIST_NAME].map do |resource_params|
        UnmanageRequest.new resource_params
      end
    end

  end
end
