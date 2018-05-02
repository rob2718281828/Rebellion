using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class RebellionView extends Ui.View {
	var bandManager;
	var myString;
	
	var time;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
		// set up all the bands
    	bandManager = new BandManager();

    	// set the day / time indices based on the current date/time
    	bandManager.setCurrent();
    }

    // Update the view
    function onUpdate(dc) {
	    var currentTime = System.getClockTime();
		var timeString = Lang.format(
		    "$1$:$2$",
		    [currentTime.hour, currentTime.min.format("%02d")]
		);
		
		// timeLabel shows the current time
		var timeLabel = Ui.View.findDrawableById("TimeLabel");
		timeLabel.setText(timeString);
		
		// dateLabel shows the date we're looking at
		var dateLabel = Ui.View.findDrawableById("DateLabel");
		dateLabel.setText(bandManager.dayString());
    
		// add skip to the index to allow manual override
		setBandString("BandLabel1", bandManager.nextBandString(0));
		setBandString("BandLabel2", bandManager.nextBandString(1));
		
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    // Handle null returns from getting band name
    function setBandString(label, bandString) {
    	var bandLabel = Ui.View.findDrawableById(label);
    	if(bandString != null) {
    		bandLabel.setText(bandString);
    	} else {
    		bandLabel.setText("");
    	}
    }
  
    // callback function to select the next band
    function nextBand() {
		bandManager.nextBand();
    }
    
    // callback function to select the prev band
    function prevBand() {
		bandManager.prevBand();
    }
    
    // callback function to cycle through days
    function cycleDay() {
		bandManager.cycleDay();
    }
   
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
