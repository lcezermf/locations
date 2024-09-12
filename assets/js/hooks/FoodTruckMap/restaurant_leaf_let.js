import L from "leaflet"

class RestaurantLeaflet {
    constructor(element, positions, markerClickedCallback) {
        this.map = L.map(element).setView(positions, 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);
    }

    addMarker(foodTruck) {
        const marker = L.marker([foodTruck.latitude, foodTruck.longitude], {
            foodTruckID: foodTruck.id
        })
            .addTo(this.map)
            .bindPopup(
                `<h3>${foodTruck.owner_name}</h3>
                <span>${foodTruck.description}</span>
                
                `
            )

        return marker
    }
}

export default RestaurantLeaflet;