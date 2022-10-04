sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ui/loaded/cars/test/integration/FirstJourney',
		'ui/loaded/cars/test/integration/pages/CarsList',
		'ui/loaded/cars/test/integration/pages/CarsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarsList, CarsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ui/loaded/cars') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarsList: CarsList,
					onTheCarsObjectPage: CarsObjectPage
                }
            },
            opaJourney.run
        );
    }
);