require "test_helper"

class ConfigurationsControllerTest < ActionDispatch::IntegrationTest
  %w[ios_v1 android_v1].each do |action|
    test "#{action} should return valid JSON" do
      get public_send("#{action}_configurations_path")
      assert_response :success
      assert_nothing_raised { JSON.parse(@response.body) }
    end
  end
end
