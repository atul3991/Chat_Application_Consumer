class ChatController < ApplicationController
  require "kafka"
  def index
    kafka = Kafka.new(["172.21.0.4:9092", "172.21.0.4:9092"])
    m = []
    loop do
      messages = kafka.fetch_messages(topic:"greetings", partition: 1)
      break if messages.empty?
      messages.each do |message|
        m<<message
      end
    end
    @messages = m
  end
end
