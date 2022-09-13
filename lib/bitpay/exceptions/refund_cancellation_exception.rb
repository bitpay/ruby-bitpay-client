module Bitpay
  module Exceptions
    class RefundCancellationException < BitpayException

      MESSAGE = 'Failed to cancel refund object'
      API_CODE = '000000'
      NAME = 'BITPAY-REFUND-REFUND'
      CODE = '165'

      # Construct the RefundCancellationException.
      #
      # @param message string [optional] The Exception message to throw.
      # @param apiCode string [optional] The API Exception code to throw.
      def initialize(name: nil, message: nil, code: '165', api_code: '000000')
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
        