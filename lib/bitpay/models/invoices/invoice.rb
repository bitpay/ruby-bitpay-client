module Bitpay
  module Models
    module Invoice

      # Creates the Invoice.
      #
      # @params price [Float]
      # @params currency [String]
      # @params sign_request [Boolean] Include signature and identity in request
      # @params params [Hash]
      #   * facade - To create the invoice for the facade
      def create_invoice(price:, currency:, sign_request: true, params: {})
        if price_format_valid?(price, currency) && currency_valid?(currency)
          params.merge!({ price: price, currency: currency })
          token = get_token(params[:facade])
          # invoice = post(path: '/invoices', token: token, sign_request: true, params: params)
          # token = get_token(params[:facade])
          # params[:token] = token
          # params[:guid] = SecureRandom.uuid

          begin
            invoice = post(path: '/invoices', token: token, sign_request: true, params: params)
          rescue => error
            raise Bitpay::Exceptions::InvoiceCreationException.new(
              message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
            )
          end

          invoice['data']
        end
      end
  
      # Fetches the invoice with a facade version using the Token and given invoiceID.
      #
      # @params id [String] Invoice ID
      # @params facade [String] Facade name to fetch the version invoice
      def get_invoice(id:, facade: ENV['FACADE_MERCHANT'])
        token = get_token(facade)

        begin
          invoice = get(path: "/invoices/#{id}", token: token)
        rescue => error
          raise Bitpay::Exceptions::InvoiceQueryException.new(
            message: "failed to serialize Invoice object : #{error.message}"
          )
        end

        invoice["data"]

      end

      # Fetches the invoices with a facade version using the Token and given query parameters.
      #
      # @params facade [String] Facade name to fetch the version invoice
      # @params params [Hash] Filter keywords which we need to filter the invoices
      #   * dateStart
      #   * dateEnd
      #   * status
      #   * orderId
      #   * limit
      #   * offset
      def get_invoices(facade:, params: {})
        token = get_token(facade)

        begin
          invoices = get(path: "/invoices", token: token, query_filter: query_filter(params))
        rescue => error
          raise Bitpay::Exceptions::InvoiceQueryException.new(
            message: "failed to serialize Invoice object : #{error.message}"
          )
        end

        invoices["data"]
      end

      def request_invoice_notification(id:, params: {})
        generated_invoice = get_invoice(id: id, facade: ENV['FACADE_MERCHANT'])
        params[:token] = generated_invoice["token"]

        begin
          invoice = post(path: "/invoices/#{id}/notifications", token: generated_invoice["token"], params: params, sign_request: true)
        rescue => error
          raise Bitpay::Exceptions::InvoiceNotificationException.new(
            name: nil, message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end
      end

      def cancel_invoice(id:, params: {})
        # invoice = get_invoice(id: id, facade: ENV['FACADE_MERCHANT'])
        params[:token] = "2xe36gVCj1vNNhNbfUkYQTimGqydSp9rX6vt2LM4cGxE"
        params[:facade] = "merchant"
        # params
        # params[:forceCancel] = force_cancel

        begin
          invoice = delete(path: "/invoices/#{id}", params: params, sign_request: true)
        rescue => error
          raise Bitpay::Exceptions::InvoiceCancellationException.new(
            name: nil, message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end

        invoice["data"]
      end

      def pay_invoice(id:, status:)
        invoice = get_invoice(id: id, facade: ENV['FACADE_MERCHANT'])
      end
  
      # Fetches the invoice with a public version on given invoiceID.
      #
      # @param id [String] Invoice ID
      def get_public_invoice(id:)
        invoice = get(path: "/invoices/#{id}", public: true)
        invoice["data"]
      end

    end
  end
end
