import consumer from "./consumer"

consumer.subscriptions.create("FleetChannel", {
  connected() {
    console.log("we are connected")
  },

  disconnected() {
  },

  received(data) {
    console.log('receiving:')
    updateMap(data.vehicles)
  },
})
