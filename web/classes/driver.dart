part of classes;

final String driverURL = 'http://ergast.com/api/f1/drivers.json?limit=1000';

class Driver {
    static List drivers = [];

    static final Random indexGen = new Random();

    String _url;
    String _givenName;
    String _familyName;
    String _nationality;
    DateTime _dateOfBirth;

    String get url         => _url;
    String get fullName    => '$_givenName $_familyName';
    String get nationality => _nationality;
    String get dateOfBirth => '${_dateOfBirth.day}/${_dateOfBirth.month}/${_dateOfBirth.year}';

    Driver() {
        var i = indexGen.nextInt(drivers.length);

        _url         = drivers[i]['url'];
        _givenName   = drivers[i]['givenName'];
        _familyName  = drivers[i]['familyName'];
        _nationality = drivers[i]['nationality'];
        _dateOfBirth = DateTime.parse(drivers[i]['dateOfBirth']);
    }

    static Future getDrivers() {
        var path = driverURL;
        return HttpRequest.getString(path)
            .then(_parseDriversFromJSON);
    }

    static _parseDriversFromJSON(String jsonString) {
        Map driversResult = JSON.decode(jsonString);
        drivers = driversResult['MRData']['DriverTable']['Drivers'];
    }
}
