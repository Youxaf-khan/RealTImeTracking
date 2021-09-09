jQuery(function ($) {
  $(window).on("load", function () {
    initMap($(".vehicles #map"));
  })
})

window.initMap = function initMap() {
  let markers = [];
  var infowindow = new google.maps.InfoWindow({})
  var map = new google.maps.Map(document.getElementById("map"), {
    center: new google.maps.LatLng(37.998819,-121.2866481),
    zoom: 4,
  })

  window.gmap = map
  window.markers = markers
  window.infowindow = infowindow
}

window.updateMap = function updateMap(locations) {
  removeMarker(locations)

  for (let i = 0; i < locations.length; i++) {
    const marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i]["gps"]["latitude"], locations[i]["gps"]["longitude"]),
      label: locations[i]["name"],
      map: gmap,
    });

    google.maps.event.addListener(marker,"click",(function (marker, i) {
      return function () {
        infowindow.setContent(
          "Name: " + locations[i]["name"] +
          ", Location: " + locations[i]["gps"]["reverseGeo"]["formattedLocation"]
        )
        infowindow.open(gmap, marker)
      }
    })(marker, i))
    markers.push(marker)
  }
}

function removeMarker(locations) {
  if (markers.length === locations.length) {

    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(null)
    }
    markers = []
  }
}
