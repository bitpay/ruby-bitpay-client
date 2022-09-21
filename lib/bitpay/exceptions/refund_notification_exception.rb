module Bitpay
  module Exceptions
    class RefundNotificationException < BitpayException

      MESSAGE = 'Failed to send refund notification'
      API_CODE = '000000'
      NAME = 'BITPAY-REFUND-NOTIFICATION'
      CODE = '166'

      # Construct the RefundNotificationException.
      #
      # @param message string [optional] The Exception message to throw.
      # @param apiCode string [optional] The API Exception code to throw.
      def initialize(name: nil, message: nil, code: '166', api_code: '000000')
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
          