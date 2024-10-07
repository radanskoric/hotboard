module TurboStreamActionsHelper
  def log(message)
    turbo_stream_action_tag :log, message:
  end
end
Turbo::Streams::TagBuilder.include(TurboStreamActionsHelper)
