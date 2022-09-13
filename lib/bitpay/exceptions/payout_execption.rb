module Bitpay
  module Exceptions
    class PayoutException < BitpayException

      MESSAGE = 'An unexpected error occurred while trying to manage the payout'
      API_CODE = '000000'
      NAME = 'BITPAY-PAYOUT-GENERIC'
      CODE = '121'

      # Construct the PayoutException
      #
      # @params message [string]
      # @params api_code [string]
      def initialize(name: nil, message: nil, code: '121', api_code: '000000')
        @name = name || NAME
        @message = message || MESSAGE
        @api_code = api_code || API_CODE
        @code = code || CODE
        message = @name + ': ' + @message + ': ' + @api_code + ': ' + @code

        return super(name: @name, message: @message, code: @code, api_code: @api_code)
      end
      
    end
  end
end
