import consumer from "./consumer"

consumer.subscriptions.create("FleetChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('we are connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    data.content
  }
});

function initMap() {
    var myCoords = new google.maps.LatLng(lat = 48.8584, lng = 2.2945);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
}
