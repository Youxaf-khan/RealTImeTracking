import { map } from "jquery";

jQuery(function ($) {
  $(window).on("load", function () {
    initMap($("#map").data("vehicles"));
  })
})

window.initMap = function initMap(locations) {
  console.log(locations)
  var map = new google.maps.Map(document.getElementById("map"), {
    zoom: 3,
    center: { lat: 37.78757983, lng: -121.18885427 },
  })

  //  updateMap(locations)

  var marker
  if (typeof locations != "undefined") {
    for (var i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
      })
    }
  }
}

window.updateMap = function updateMap(locations) {
  // map = new google.maps.Map(document.getElementById("map"))
  var marker
  if (typeof locations != "undefined") {
    for (var i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
      })
    }
  }
}
