module Bitpay
  module Exceptions
    class PayoutBatchException < BitpayException

      MESSAGE = 'An unexpected error occurred while trying to manage the payout batch'
      API_CODE = '000000'
      NAME = 'BITPAY-PAYOUT-BATCH-GENERIC'
      CODE = '201'

      # Construct the PayoutBatchException
      #
      # @params message [string]
      # @params api_code [string]
      def initialize(name: nil, message: nil, code: '201', api_code: '000000')
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
