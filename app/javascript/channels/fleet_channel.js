import consumer from "./consumer"

consumer.subscriptions.create("FleetChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("we are connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Receving:")
    const vehicle = data.vehicle
    const tableBody = document.getElementById("table-body")

    // for (const vehicle of vehicles) {
      const tr = document.createElement("tr")
      const content = `<td>${vehicle.latitude}</td>
      <td>${vehicle.longitude}</td>`

      tr.innerHTML = content
      tableBody.appendChild(tr)
    // }
  },
})
