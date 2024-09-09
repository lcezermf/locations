import L from "leaflet"

class RestaurantLeaflet {
    constructor(element, positions, markerClickedCallback) {
        console.log(element)
        this.map = L.map(element).setView(positions, 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);
    }
}

export default RestaurantLeaflet;