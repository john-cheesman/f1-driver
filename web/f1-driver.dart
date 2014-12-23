import 'dart:html';
import 'classes/classes.dart';

ButtonElement randomDriverButton;
DataListElement nationalityDescription;
DataListElement dateOfBirthDescription;

void main() {
    randomDriverButton = querySelector('.js-random-driver');
    nationalityDescription = querySelector('.js-nationality');
    dateOfBirthDescription = querySelector('.js-date-of-birth');

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

    print(driver.fullName);
}

void randomDriver(Event e) {
    updateDriver();
}
