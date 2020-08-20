require 'paypal-checkout-sdk'

module PayPalClient
  class << self

    # Set up and return PayPal Ruby SDK environment with PayPal access credentials.
    # This sample uses SandboxEnvironment. In production, use LiveEnvironment.
    def environment
      client_id = ENV['PAYPAL_CLIENT_ID'] || 'AdQijk0RtmORk0Ye2bMh0S88dfkrBdeIxNP2fO_FovEn3gYxT_d_fMFKZKPgAYY26npLUO20T6ysH0pq'
      client_secret = ENV['PAYPAL_CLIENT_SECRET'] || 'EHhkaScdOiX87xkDZhl8Nsp7X7I9uS2c1Mi8Z364H_agBv6Rue55EsHjQj_GsTMf-VK5iH-jZApVM8EZ'

      PayPal::SandboxEnvironment.new(client_id, client_secret)
    end

    # Returns PayPal HTTP client instance with environment that has access
    # credentials context. Use this instance to invoke PayPal APIs, provided the
    # credentials have access.
    def client
      PayPal::PayPalHttpClient.new(self.environment)
    end

    # Utility to convert Openstruct Object to JSON hash.
    def openstruct_to_hash(object, hash = {})
      object.each_pair do |key, value|
        hash[key] = value.is_a?(OpenStruct) ? openstruct_to_hash(value) : value.is_a?(Array) ? array_to_hash(value) : value
      end
      hash
    end

    # Utility to convert array of OpenStruct to hash.
    def array_to_hash(array, hash= [])
      array.each do |item|
        x = item.is_a?(OpenStruct) ? openstruct_to_hash(item) : item.is_a?(Array) ? array_to_hash(item) : item
        hash << x
      end
      hash
    end
  end
end