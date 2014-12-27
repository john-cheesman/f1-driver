import 'dart:html';
import 'classes/classes.dart';

ButtonElement randomDriverButton;
LinkElement biographyLink;
DataListElement nationalityDescription;
DataListElement dateOfBirthDescription;
DataListElement racesTotalDescription;


void main() {
    randomDriverButton     = querySelector('.js-random-driver');
    biographyLink          = querySelector('.js-biography');
    nationalityDescription = querySelector('.js-nationality');
    dateOfBirthDescription = querySelector('.js-date-of-birth');
    racesTotalDescription  = querySelector('.js-races-total');

    randomDriverButton.onClick.listen(randomDriver);

    Driver.getDrivers()
        .then((_) {
            updateDriver();
        })
        .catchError((error) {
            print("Couldn't find drivers: $error");
        });
}

void updateDriver() {
    var driver = new Driver();

    driver.getRaces(driver.driverId)
        .then((_) {
            racesTotalDescription.text = driver.racesTotal;
        })
        .catchError((error) {
            print("Couldn't get races total");
        });

    biographyLink
        ..text = driver.fullName
        ..href = driver.url;

    nationalityDescription.text = driver.nationality;
    dateOfBirthDescription.text = driver.dateOfBirth;
}

void randomDriver(Event e) {
    updateDriver();
}
