module Bitpay
  module Models
    module PayoutBatch

      def create_payout_batch()
        token = get_token(params[:facade])

        begin
          bill = post(path: '/payoutBatches', token: token, sign_request: true, params: params)
        rescue => error
          raise Bitpay::Exceptions::BillCreationException.new(
            message: "failed to deserialize BitPay server response (Invoice) : #{error.message}"
          )
        end
      end

      def get_payout_batch()

      end

      def get_payout_batches()

      end

    end
  end
end