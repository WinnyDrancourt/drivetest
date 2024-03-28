module ApplicationHelper
  def itinerary_jsonld(itinerary)
    {
      "@context": 'https://schema.org',
      "@type": 'Trip',
      "name": itinerary.title,
      "departureTime": {
        "@type": 'DateTime',
        "departureTime": itinerary.start_date
      },
      "itinerary": {
        "@type": 'ItemList',
        "itemListElement": itinerary.destinations.each_with_index.map do |d, _i|
          {
            "@type": 'Trip',
            "name": d.city,
            "description": d.notes
          }
        end
      },
      "provider": {
        "@type": 'Person',
        "name": itinerary.user.pseudo
      }
    }.to_json.html_safe
  end

  def user_jsonld(user)
    {
      "@context": 'https://schema.org',
      "@type": 'Person',
      "name": "#{user.first_name} #{user.last_name}",
      "city": user.city,
      "zipcode": user.zipcode,
      "pseudo": user.pseudo
    }.to_json.html_safe
  end

  def destination_jsonld(destination)
    {
      "@context": 'https://schema.org',
      "@type": 'Place',
      "name": destination.city,
      "notes": destination.notes,
      "stayingTime": destination.staying_time
    }.to_json.html_safe
  end


end
