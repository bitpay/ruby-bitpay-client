module Bitpay
  module Exceptions
    class RefundException < BitpayException

      MESSAGE = 'An unexpected error occurred while trying to manage the refund'
      API_CODE = '000000'
      NAME = 'BITPAY-REFUND-GENERIC'
      CODE = '161'

      # Construct the RefundException.
      #
      # @param message string [optional] The Exception message to throw.
      # @param apiCode string [optional] The API Exception code to throw.
      def initialize(name: nil, message: nil, code: '161', api_code: '000000')
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
  