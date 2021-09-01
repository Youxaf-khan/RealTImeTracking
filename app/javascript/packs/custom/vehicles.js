import { map } from "jquery";

jQuery(function ($) {
  $(window).on("load", function () {
    initMap($("#map").data("vehicles"));
  })
})

window.initMap = function initMap(locations) {
  var map = new google.maps.Map(document.getElementById("map"), {
    zoom: 3,
    center: { lat: 37.78757983, lng: -121.18885427 },
  })
  window.mymap = map

  var infowindow = new google.maps.InfoWindow({})
  var marker

  if (typeof locations != "undefined") {

    for (var i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
      });
    }
  }
}

window.updateMap = function updateMap(locations) {
  var marker
  if (typeof locations != "undefined") {

    for (var i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: mymap,
      })

      google.maps.event.addListener(marker,"click",(function (marker, i) {
          return function () {
            infowindow.setContent(
              "id: " + locations[i][0] + ", Location: " + locations[i][3]
            )
            infowindow.open(mymap, marker)
          }
        })(marker, i)
      )
    }
  }
}
