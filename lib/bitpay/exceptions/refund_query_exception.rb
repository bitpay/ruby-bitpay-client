module Bitpay
    module Exceptions
      class RefundQueryException < BitpayException
  
        MESSAGE = 'Failed to retrieve refund'
        API_CODE = '000000'
        NAME = 'BITPAY-REFUND-GET'
        CODE = '163'
  
        # Construct the RefundQueryException.
        #
        # @param message string [optional] The Exception message to throw.
        # @param apiCode string [optional] The API Exception code to throw.
        def initialize(name: nil, message: nil, code: '163', api_code: '000000')
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
      