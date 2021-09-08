import consumer from "./consumer"

consumer.subscriptions.create("FleetChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    updateMap(data.vehicles)
  },
})
