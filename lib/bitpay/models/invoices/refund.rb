module Bitpay
  module Models
    module Refund

      def create_refund(invoice_id:, amount:, currency:, preview: false, immediate: false, buyer_pays_refund_fee: false, params: {})
        if price_format_valid?(amount, currency) && currency_valid?(currency)
          params.merge!({ amount: amount, currency: currency })

          params.merge!({ invoiceId: invoice_id, preview: preview, immediate: immediate, buyer_pays_refund_fee: buyer_pays_refund_fee })
          token = get_token(ENV['FACADE_MERCHANT'])
          
          begin
            refund = post(path: '/refunds', token: token, sign_request: true, params: params)
          rescue => error
            raise Bitpay::Exceptions::RefundCreationException.new(
              name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
            )
          end

          refund['data']
        end
      end

      def update_refund(refund_id:, status:, params: {})
        params.merge!({ status: status })

        token = get_token(ENV['FACADE_MERCHANT'])

        begin
          refund = post(path: "/refunds/#{refund_id}", token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::RefundUpdateException.new(
            name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
          )
        end

        refund['data']
      end

      def get_refunds(invoice_id:, params: {})
        params.merge!({ invoiceId: invoice_id })

        token = get_token(ENV['FACADE_MERCHANT'])

        begin
          refunds = get(path: "refunds/", token: token, query_filter: query_filter(params))
        rescue => error
          raise Bitpay::Exceptions::RefundQueryException.new(
            name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
          )
        end

        refunds['data']
      end

      def get_refund(refund_id:)
        token = get_token(ENV['FACADE_MERCHANT'])

        begin
          refunds = get(path: "refunds/#{refund_id}", token: token)
        rescue => error
          raise Bitpay::Exceptions::RefundQueryException.new(
            name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
          )
        end
      end

      def request_refund_notification(refund_id:)
        token = get_token(ENV['FACADE_MERCHANT'])

        begin
          refund = get(path: "refunds/#{refund_id}/notifications", token: token)
        rescue => error
          raise Bitpay::Exceptions::RefundNotificationException.new(
            name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
          )
        end
      end

      def cancel_refund(refund_id:)
        token = get_token(ENV['FACADE_MERCHANT'])

        begin
          refund = get(path: "refunds/#{refund_id}", token: token)
        rescue => error
          raise Bitpay::Exceptions::RefundCancellationException.new(
            name: nil, message: "failed to deserialize BitPay server response (Refund) : #{error.message}"
          )
        end

        refunds['data']
      end

    end
  end
end