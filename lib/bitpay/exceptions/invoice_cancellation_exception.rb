module Bitpay
  module Exceptions
    class InvoiceCancellationException < InvoiceException

      MESSAGE = 'Failed to cancel invoice'
      API_CODE = '000000'
      NAME = 'BITPAY-INVOICE-CANCEL'
      CODE = '102'

      # Construct the InvoiceCancellationException.
      #
      # @param message string [optional] The Exception message to throw.
      # @param apiCode string [optional] The API Exception code to throw.
      def initialize(name: nil, message: nil, code: '105', api_code: '000000')
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
  