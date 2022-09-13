module Bitpay
  module Models
    module Payout

      def create_payout()
        token = get_token(params[:facade])

        begin
          bill = post(path: '/payouts', token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillCreationException.new(
            message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end
      end

      def get_payout()

      end

      def get_payouts()

      end

      def cancel_payout()

      end

      def request_payout_notification()

      end

    end
  end
end