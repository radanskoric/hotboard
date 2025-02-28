class ConfigurationsController < ApplicationController
  BASIC_CONFIGURATION = {
    settings: {},
    rules: [
      {
        patterns: [
          "/new$",
          "/edit$"
        ],
        properties: {
          context: "modal"
        }
      }
    ]
  }.freeze

  def ios_v1
    render json: BASIC_CONFIGURATION
  end

  def android_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            ".*"
          ],
          properties: {
            context: "default",
            uri: "hotwire://fragment/web",
            pull_to_refresh_enabled: true
          }
        },
        {
          patterns: [
            "/new(\\?.*)?$",
            "/edit$"
          ],
          properties: {
            context: "modal",
            pull_to_refresh_enabled: false
          }
        }
      ]
    }
  end
end
