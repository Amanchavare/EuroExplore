import Foundation
import MapKit

class LocationsDataService {

    static let locations: [Location] = [
        // Italy - Rome
        Location(
            name: "Colosseum",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"
        ),
        
        // France - Paris
        Location(
            name: "Eiffel Tower",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. It has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"
        ),
        
        // Spain - Barcelona
        Location(
            name: "Sagrada Familia",
            cityName: "Barcelona",
            coordinates: CLLocationCoordinate2D(latitude: 41.4036, longitude: 2.1744),
            description: "The Sagrada Familia is a large unfinished Roman Catholic basilica in Barcelona, designed by architect Antoni Gaudí. It is one of the most visited monuments in Spain and a UNESCO World Heritage Site.",
            imageNames: [
                "barcelona-sagradafamilia-1",
                "barcelona-sagradafamilia-2",
                "barcelona-sagradafamilia-3"
            ],
            link: "https://en.wikipedia.org/wiki/Sagrada_Familia"
        ),
        
        // Germany - Berlin
        Location(
            name: "Brandenburg Gate",
            cityName: "Berlin",
            coordinates: CLLocationCoordinate2D(latitude: 52.5163, longitude: 13.3777),
            description: "The Brandenburg Gate is an 18th-century neoclassical monument in Berlin, Germany. It is a symbol of Germany's reunification and is one of the most famous landmarks in the country.",
            imageNames: [
                "berlin-brandenburggate-1",
                "berlin-brandenburggate-2",
                "berlin-brandenburggate-3"
            ],
            link: "https://en.wikipedia.org/wiki/Brandenburg_Gate"
        ),
        
        // United Kingdom - London
        Location(
            name: "Big Ben",
            cityName: "London",
            coordinates: CLLocationCoordinate2D(latitude: 51.5007, longitude: -0.1246),
            description: "Big Ben is the nickname for the Great Bell of the Great Clock of Westminster, at the north end of the Palace of Westminster in London. It is one of the most iconic landmarks of the UK.",
            imageNames: [
                "london-bigben-1",
                "london-bigben-2",
            ],
            link: "https://en.wikipedia.org/wiki/Big_Ben"
        ),
        
        // Switzerland - Zurich
        Location(
            name: "Lake Zurich",
            cityName: "Zurich",
            coordinates: CLLocationCoordinate2D(latitude: 47.3784, longitude: 8.5402),
            description: "Lake Zurich is a lake in the city of Zurich, Switzerland, surrounded by picturesque views and perfect for boat tours and scenic walks.",
            imageNames: [
                "zurich-lakezurich-1",
                "zurich-lakezurich-2",
                "zurich-lakezurich-3"
            ],
            link: "https://en.wikipedia.org/wiki/Lake_Zurich"
        ),
        
        // Netherlands - Amsterdam
        Location(
            name: "Anne Frank House",
            cityName: "Amsterdam",
            coordinates: CLLocationCoordinate2D(latitude: 52.3752, longitude: 4.8839),
            description: "The Anne Frank House is a museum in Amsterdam dedicated to the Jewish diarist Anne Frank, who hid from Nazi persecution in a secret annex with her family.",
            imageNames: [
                "amsterdam-annefrankhouse-1",
                "amsterdam-annefrankhouse-2",
                "amsterdam-annefrankhouse-3"
            ],
            link: "https://en.wikipedia.org/wiki/Anne_Frank_House"
        ),
        
        // Greece - Athens
        Location(
            name: "Acropolis of Athens",
            cityName: "Athens",
            coordinates: CLLocationCoordinate2D(latitude: 37.9715, longitude: 23.7267),
            description: "The Acropolis of Athens is an ancient citadel located on a rocky outcrop above the city of Athens. It contains several ancient buildings of great architectural and historical significance, most notably the Parthenon.",
            imageNames: [
                "athens-acropolis-1",
                "athens-acropolis-2",
                "athens-acropolis-3"
            ],
            link: "https://en.wikipedia.org/wiki/Acropolis_of_Athens"
        ),
        
        // Austria - Vienna
        Location(
            name: "Schönbrunn Palace",
            cityName: "Vienna",
            coordinates: CLLocationCoordinate2D(latitude: 48.1850, longitude: 16.3120),
            description: "Schönbrunn Palace is a former imperial summer residence located in Vienna, Austria. It is one of the most important cultural monuments in Austria and a UNESCO World Heritage Site.",
            imageNames: [
                "vienna-schonbrunnpalace-1",
                "vienna-schonbrunnpalace-2",
                "vienna-schonbrunnpalace-3"
            ],
            link: "https://en.wikipedia.org/wiki/Sch%C3%B6nbrunn_Palace"
        ),
        
        // Hungary - Budapest
        Location(
            name: "Buda Castle",
            cityName: "Budapest",
            coordinates: CLLocationCoordinate2D(latitude: 47.4979, longitude: 19.0402),
            description: "Buda Castle is the historical castle and palace complex of the Hungarian kings in Budapest, Hungary. It was first completed in 1265 and offers stunning views of the city.",
            imageNames: [
                "budapest-budacastle-1",
                "budapest-budacastle-2",
                "budapest-budacastle-3"
            ],
            link: "https://en.wikipedia.org/wiki/Buda_Castle"
        ),
    ]
}
