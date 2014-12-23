import 'classes/classes.dart';

void main() {
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
