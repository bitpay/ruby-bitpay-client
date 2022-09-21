module Bitpay
  module Exceptions
    class PayoutRecipientCancellationException < PayoutRecipientException

      MESSAGE = 'Failed to cancel payout recipient'
      API_CODE = '000000'
      NAME = 'BITPAY-PAYOUT-RECIPIENT-CANCEL'
      CODE = '194'

      # Construct the PayoutRecipientCancellationException
      #
      # @params message [string]
      # @params api_code [string]
      def initialize(name: nil, message: nil, code: '194', api_code: '000000')
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
