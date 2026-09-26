module Qbo
    class AuthenticationService 
        REDIRECT_URI = Rails.application.credentials.dig(:qbo, :redirect_uri).freeze
        def self.auth_url(state:)
            QBO_OAUTH_CLIENT.auth_code.authorize_url(
                redirect_uri: REDIRECT_URI,
                response_type: "code",
                scope: "com.intuit.quickbooks.accounting".freeze,
                state: state
            )
        end

        def self.handle_callback(code:, realm_id:)
            auth_token = QBO_OAUTH_CLIENT.auth_code.get_token(
                code,
                redirect_uri: REDIRECT_URI
            )
            
        end



    end
end