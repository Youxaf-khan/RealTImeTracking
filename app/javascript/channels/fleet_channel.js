import consumer from "./consumer"

$(document).on("turbolinks:load", function () {

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
      console.log("receving:")
      var vehicles = data.vehicle

      var tbody = $("#vehicles tbody"),
        props = ["latitude", "longitude"]
      $.each(vehicles, function (i, vehicle) {
        var tr = $("<tr>")
        $.each(props, function (i, prop) {
          $("<td>").html(vehicle[prop]).appendTo(tr)
        })
        tbody.append(tr)
      })

        // $("div").append(
        //   "<div>" + data.vehicle[0]["latitude"] + "</div>" +
        //   "<div>" + data.vehicle[0]["longitude"] + "</div>"
        // )
    },
  })

});
