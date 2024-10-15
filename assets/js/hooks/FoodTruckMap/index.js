import RestaurantLeaflet from "./restaurant_leaf_let"

const FoodTruckMap = {
    mounted() {
        selectPoint = JSON.parse(this.el.dataset.selectPoint)
        this.map = new RestaurantLeaflet(this.el, [selectPoint.latitude, selectPoint.longitude], event => {
            const id = event.target.options.foodTruckID

            this.pushEvent("marker-clicked", id, (reply, ref) => {
                this.scrollTo(reply.foodTruckID)
            })
        })


        this.pushEvent("load-food-trucks", {}, (reply, ref) => {
            reply.food_trucks.forEach(foodTruck => {
                this.map.addMarker(foodTruck)
            })
        });

        this.handleEvent("highlight_marker", foodTruck => {
            this.map.highlightMarker(foodTruck)
        })
    },

    scrollTo(foodTruckID) {
        document.querySelector(`[phx-value-id=${foodTruckID}]`)
    }
}

export default FoodTruckMap;