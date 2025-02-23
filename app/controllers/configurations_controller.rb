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
    render json: BASIC_CONFIGURATION
  end
end
