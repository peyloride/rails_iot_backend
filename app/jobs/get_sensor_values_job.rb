class GetSensorValuesJob < ApplicationJob
  queue_as :default
  after_perform do |job|
    sleep 300
    GetSensorValuesJob.perform_later('hebebebe')
  end

  def perform(*args)
    # Do something later
    User.all.each do |user|
      user.sensors.each do |sensor|
        sensor.values.create(light: CoAP::Client.new.get_by_uri("coap://#{sensor.address}/sensors/ambient_light").payload,
                            temperature: CoAP::Client.new.get_by_uri("coap://#{sensor.address}/sensors/temperature").payload)
        puts "#{sensor.address}"
        puts CoAP::Client.new.get_by_uri("coap://#{sensor.address}/sensors/temperature").payload
      end
    end
  end
end
