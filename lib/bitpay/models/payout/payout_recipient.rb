module Bitpay
  module Models
    module PayoutRecipient

      def create_payout_recipient(sign_request: true, params: {})
        token = get_token(ENV['FACADE_PAYOUT'])

        begin
          payout_recipient = post(path: '/recipients', token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillCreationException.new(
            message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end
      end

      def get_payout_recipient()

      end

      def get_payout_recipients()

      end

      def update_payout_recipient()

      end

      def delete_payout_recipient()

      end

      def request_payout_recipient_notification()

      end

    end
  end
end