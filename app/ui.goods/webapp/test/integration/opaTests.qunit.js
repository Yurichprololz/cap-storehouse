sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ui/goods/test/integration/FirstJourney',
		'ui/goods/test/integration/pages/GoodsList',
		'ui/goods/test/integration/pages/GoodsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GoodsList, GoodsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ui/goods') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGoodsList: GoodsList,
					onTheGoodsObjectPage: GoodsObjectPage
                }
            },
            opaJourney.run
        );
    }
);