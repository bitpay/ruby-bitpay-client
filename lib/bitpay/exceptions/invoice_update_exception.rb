module Bitpay
  module Exceptions
    class InvoiceUpdateException < InvoiceException

      MESSAGE = 'Failed to update invoice'
      API_CODE = '000000'
      NAME = 'BITPAY-INVOICE-UPDATE'
      CODE = '102'

      # Construct the InvoiceUpdateException.
      #
      # @param message string [optional] The Exception message to throw.
      # @param apiCode string [optional] The API Exception code to throw.
      def initialize(name: nil, message: nil, code: '104', api_code: '000000')
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
  