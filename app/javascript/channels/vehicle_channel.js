import consumer from "./consumer"

consumer.subscriptions.create("VehicleChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    updateMap(data.vehicles)
  },
})
