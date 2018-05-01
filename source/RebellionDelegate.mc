using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class RebellionDelegate extends Ui.BehaviorDelegate {
	var mView;
	
    function initialize(view) {
    	mView = view;
    }

    function onNextBand() {
    	mView.nextBand();
    }
    function onPrevBand() {
    	mView.prevBand();
    }
    
    function onNextDay() {
    	mView.nextDay();
    }
    
    function onPrevDay() {
    	mView.prevDay();
    }
}