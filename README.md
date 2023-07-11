# Astronauts

## Requirements/Implementation details

* On app launch, consume `https://spacelaunchnow.me/api/3.5.0/astronaut/`
* When the data is retrieved, display the results in a list.
* Display at a minimum: *name*, *nationality* and *profile_image_thumbnail*
* Implement a button at the top of the screen which will allow the user to sort the results based on the *name* property.
* On tap of an individual list item, consume `https://spacelaunchnow.me/api/3.5.0/astronaut/<astronautId>` to retrieve more details about the item and navigate to a new screen which displays the results appropriately.
* Display all previous information + at a minimum: *bio* and *date_of_birth*
