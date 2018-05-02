using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class RebellionDelegate extends Ui.BehaviorDelegate {
	var mView;
	
    function initialize(view) {
    	mView = view;
    }

    function onTapRight() {
    	mView.nextBand();
    }
    function onTapLeft() {
    	mView.prevBand();
    }
    
    function onTapUp() {
    }
    
    function onTapDown() {
    	mView.cycleDay();
    }
}