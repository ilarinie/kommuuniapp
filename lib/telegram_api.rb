class TelegramApi
  require 'telegram/bot'

  @token =  ENV["TELEGRAM_BOT_TOKEN"]
  @channel_id =  ENV["TELEGRAM_CHANNEL_ID"]


  def self.send_to_channel message
    if not ENV["TELEGRAM_BOT_TOKEN"].nil? && ENV["TELEGRAM_CHANNEL_ID"].nil?
    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @channel_id, text: message)
    end
  end
end
end
