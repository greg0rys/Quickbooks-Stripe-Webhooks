require 'swagger_helper'

RSpec.describe 'QBO OAuth API', type: :request do
  path '/qbo/connect' do
    get 'Initiates Intuit OAuth 2.0 handshake' do
      tags 'OAuth'
      produces 'text/html'

      response '302', 'redirects user to Intuit authorization page' do
        run_test!
      end
    end
  end

  path '/qbo/callback' do
    get 'Handles Intuit OAuth 2.0 callback' do
      tags 'OAuth'
      produces 'text/html'

      parameter name: :code, in: :query, type: :string, required: true, description: 'Intuit authorization code'
      parameter name: :state, in: :query, type: :string, required: true, description: 'CSRF security token'
      parameter name: :realmId, in: :query, type: :string, required: true, description: 'QBO Company Realm ID'

      response '302', 'tokens exchanged and saved, redirects to admin' do
        let(:code) { 'test_auth_code' }
        let(:state) { 'test_state' }
        let(:realmId) { '123456789' }

        before do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ qbo_oauth_state: 'test_state' })
          allow(Qbo::AuthenticationService).to receive(:handle_callback).and_return(
            double('Credential', realm_id: '123456789')
          )
        end

        run_test!
      end
    end
  end
end