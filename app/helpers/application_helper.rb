module ApplicationHelper
    def itinerary_jsonld(itinerary)
        {
          "@context": "https://schema.org",
          "@type": "Trip",
          "name": itinerary.title,
          "datetime": itinerary.start_date,
          "itinerary": {
            "@type": "ItemList",
            "itemListElement": itinerary.destinations.each_with_index.map { |d, i|
              {
                "@type": "Trip",
                "name": d.city,
                "description": d.notes
              }
            }
          },
          "provider": {
            "@type": "Person",
            "name": itinerary.user
          },
        }.to_json.html_safe
      end
end
