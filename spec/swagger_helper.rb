# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.openapi_root = Rails.root.join('swagger').to_s

  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Stripe to QuickBooks Reconciliation API',
        version: 'v1',
        description: 'Webhook processing and synchronization endpoints for Stripe & QuickBooks Online.'
      },
      paths: {},
      servers: [
        {
          url: 'https://qbo.shenefelt.org',
          description: 'Production Server'
        },
        {
          url: 'https://api.qbo.shenefelt.org',
          description: 'Production API Subdomain (if applicable)'
        },
        {
          url: 'http://localhost:3000',
          description: 'Local Development Server'
        }
      ]
    }
  }

  config.openapi_format = :yaml
end
