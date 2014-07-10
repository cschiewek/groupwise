module Groupwise
  class PostOfficeAgent
    attr_reader :endpoint, :client

    def initialize(endpoint, username, app_name, app_key)
      @endpoint, @username, @app_name, @app_key = endpoint, username, app_name, app_key
      @client = Savon.client(wsdl: wsdl, endpoint: endpoint)
      login
    end

    def version
      @version ||= begin
        body = HTTPI.get(HTTPI::Request.new(endpoint)).body
        version = body.match(/(?<=POA )([^\n\r]*)/).captures.first
      end
    end

    def wsdl
      @wsdl ||= begin
        wsdl_version = Groupwise.wsdl_version(version)
        File.expand_path("../../../contrib/novell/GW#{wsdl_version}/groupwise.wsdl", __FILE__)
      end
    end

    def logout
      response = authenticated_request(:logout)
      @session = nil if response[:status][:code] == '0'
      return response
    end

    def free_busy(email_addresses, start_time = nil, end_time = nil)
      message = { free_busy_session_id: free_busy_session(email_addresses) }
      message[:start_time] = start_time if start_time
      message[:end_time] = end_time if end_time
      response = authenticated_request(:get_free_busy, message)[:free_busy_info]
    end

    private 

    def login
      message = {
        auth: { username: @username, name: @app_name, key: @app_key }, 
        version: '1.05', language: 'en',
        attributes!: { auth: { 'xsi:type' => 'q1:TrustedApplication' } }
      }
      response = @client.call(:login_request, message: message)
      @session = response.body[:login_response][:session]
      response.body[:login_response]
    end

    def authenticated_request(method, message = nil)
      response = @client.call(
        "#{method}_request".to_sym, 
        message: message, 
        soap_header: { session: @session }
      )
      response.body["#{method}_response".to_sym]
    end

    def free_busy_session(email_addresses)
      @free_busy_session ||= begin
        users = email_addresses.map{|email| { user: { email: email } } }.first
        response = authenticated_request(:start_free_busy_session, { users: users })
        response[:free_busy_session_id]
      end 
    end

  end
end
