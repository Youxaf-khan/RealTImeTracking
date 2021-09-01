import consumer from "./consumer"

consumer.subscriptions.create("FleetChannel", {
  connected() {
    console.log("we are connected")
  },

  disconnected() {
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('receiving:')
    updateMap(data.vehicles)
  },
})
