part of classes;

final String driverURL = 'http://ergast.com/api/f1/drivers.json?limit=1000';

class Driver {
    static List drivers = [];

    static final Random indexGen = new Random();

    String _url;
    String _givenName;
    String _familyName;
    String _dateOfBirth;
    String _nationality;

    Driver() {
        var index = indexGen.nextInt(drivers.length);

        _url = drivers[index].url;
        _givenName = drivers[index].givenName;
        _familyName = drivers[index].familyName;
        _dateOfBirth = drivers[index].dateOfBirth;
        _nationality = drivers[index].nationality;
    }

    static Future getDrivers() {
        var path = driverURL;
        return HttpRequest.getString(path)
            .then(_parseDriversFromJSON);
    }

    static _parseDriversFromJSON(String jsonString) {
        Map driversResult = JSON.decode(jsonString);
        drivers = driversResult['MRData.DriverTable.Drivers'];
    }
}
