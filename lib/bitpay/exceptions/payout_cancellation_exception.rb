module Bitpay
  module Exceptions
    class PayoutCancellationException < PayoutException

      MESSAGE = 'Failed to cancel payout'
      API_CODE = '000000'
      NAME = 'BITPAY-PAYOUT-CANCEL'
      CODE = '124'

      # Construct the PayoutCancellationException
      #
      # @params message [string]
      # @params api_code [string]
      def initialize(name: nil, message: nil, code: '124', api_code: '000000')
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
