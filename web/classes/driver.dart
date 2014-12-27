part of classes;

final String baseUrl       = 'http://ergast.com/api/f1/drivers';
final String driverUrlPart = '.json?limit=1000';
final String racesUrlPart  = '/results.json?limit=1000';

class Driver {
    static List drivers = [];

    static final Random indexGen = new Random();

    String _driverId;
    String _url;
    String _givenName;
    String _familyName;
    String _nationality;
    DateTime _dateOfBirth;
    String _racesTotal;
    List _races = [];

    String get driverId    => _driverId;
    String get url         => _url;
    String get fullName    => '$_givenName $_familyName';
    String get nationality => _nationality;
    String get dateOfBirth => '${_dateOfBirth.day}/${_dateOfBirth.month}/${_dateOfBirth.year}';
    String get racesTotal  => _racesTotal;

    Driver() {
        var i = indexGen.nextInt(drivers.length);

        _driverId    = drivers[i]['driverId'];
        _url         = drivers[i]['url'];
        _givenName   = drivers[i]['givenName'];
        _familyName  = drivers[i]['familyName'];
        _nationality = drivers[i]['nationality'];
        _dateOfBirth = DateTime.parse(drivers[i]['dateOfBirth']);
    }

    static Future getDrivers() {
        var path = '$baseUrl$driverUrlPart';
        return HttpRequest.getString(path)
            .then(_parseDriversFromJSON);
    }

    static _parseDriversFromJSON(String jsonString) {
        Map driversResult = JSON.decode(jsonString);
        drivers = driversResult['MRData']['DriverTable']['Drivers'];
    }

    Future getRaces(driverId) {
        var path = '$baseUrl/$driverId$racesUrlPart';
        return HttpRequest.getString(path)
            .then(_parseRacesFromJSON);
    }

    void _parseRacesFromJSON(String jsonString) {
        Map racesResult = JSON.decode(jsonString);
        _racesTotal = racesResult['MRData']['total'];
        _races = racesResult['MRData']['RaceTable']['Races'];
    }
}
