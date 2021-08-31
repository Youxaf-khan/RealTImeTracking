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
    initMap(data.vehicles)

    // var tbody = $("#vehicles tbody"),
    //   props = ["latitude", "longitude"]
    // $.each(vehicles, function (i, vehicle) {
    //   var tr = $("<tr>")
    //   $.each(props, function (i, prop) {
    //     $("<td>").html(vehicle[prop]).appendTo(tr)
    //   })
    //   tbody.append(tr)
    // })

      // $("div").append(
      //   "<div>" + data.vehicle[0]["latitude"] + "</div>" +
      //   "<div>" + data.vehicle[0]["longitude"] + "</div>"
      // )
  },
})
