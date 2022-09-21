module Bitpay
  module Exceptions
    class RateException < BitpayException

      MESSAGE = 'An unexpected error occurred while trying to manage the rates'
      API_CODE = '000000'
      NAME = 'BITPAY-RATES-GENERIC'
      CODE = '101'

      # @params message [string]
      # @params api_code [string]
      def initialize(name: nil, message: nil, code: '101', api_code: '000000')
        @name = name || NAME
        @message = message || MESSAGE
        @api_code = api_code || API_CODE
        @code = code || CODE
        message = @name + ': ' + @message + ': ' + @api_code + ': ' + @code

        return super(message)
      end
      
    end
  end
end
    