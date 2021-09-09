import consumer from "./consumer"

consumer.subscriptions.create("VehiclesChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    updateMap(data.vehicles)
  },
})
