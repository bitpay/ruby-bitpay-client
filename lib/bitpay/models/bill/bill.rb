module Bitpay
  module Models
    module Bill

      def create_bill(facade:, sign_request: true, params: {})
        token = get_token(params[:facade])

        begin
          bill = post(path: '/bills', token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillCreationException.new(
            message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end
      end

      def get_bill(id:, facade: ENV['FACADE_MERCHANT'], sign_request: true)
        token = get_token(facade)

        begin
          bill = get(path: "/bills/#{id}", token: token, sign_request: true)
        rescue => error
          raise Bitpay::Exceptions::BillQueryException.new(
            message: "failed to serialize Bill object : #{error.message}"
          )
        end

        bill["data"]
      end

      def get_bills(status:, facade: ENV['FACADE_MERCHANT'], params: {})
        token = get_token(facade)

        params.merge!({ status: status })

        begin
          bills = get(path: "/bills", token: token, query_filter: query_filter(params))
        rescue => error
          raise Bitpay::Exceptions::BillQueryException.new(
            message: "failed to serialize Bill object : #{error.message}"
          )
        end

        bills["data"]
      end

      def update_bill(id:, params: {})
        created_bill = get_bill(id: id, facade: ENV['FACADE_MERCHANT'], sign_request: true)
        token = created_bill['token']

        begin
          bill = update(path: "/bills/#{id}", token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillUpdateException.new(
            message: "failed to deserialize BitPay server response (Bill) : #{error.message}"
          )
        end
      end

      def deliver_bill(id:, bill_token:, sign_request: true)
        token = get_token(bill_token)

        begin
          bill = post(path: "/bills/#{id}/deliveries", token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillCreationException.new(
            message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end

        bill['data']
      end

    end
  end
end