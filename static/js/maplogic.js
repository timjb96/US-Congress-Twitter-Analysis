//var selector = select("sessionSelect");
const selectElement = document.getElementById("sessions");

selectElement.addEventListener("change", function() {
  const selectedValue = selectElement.value;
  console.log("Selected value: ", selectedValue);
});

// Create map instance
var chart = am4core.create("chartdiv", am4maps.MapChart);
// Set map definition
chart.geodata = am4geodata_region_usa_congressional_usaCongressionalLow;
// Set projection
chart.projection = new am4maps.projections.AlbersUsa();
// Create map polygon series
var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());
// Make map load polygon (like country names) data from GeoJSON
polygonSeries.useGeodata = true;

// Configure series
var polygonTemplate = polygonSeries.mapPolygons.template;
polygonTemplate.tooltipText = "{STATENAME} {name} , District ID  {id}";
polygonTemplate.fill = am4core.color("#74B266");
// Create hover state and set alternative fill color
var hs = polygonTemplate.states.create("hover");
hs.properties.fill = am4core.color("#367B25");

//import .csv array
const congdata = new Array ("output.js");

//import charts data
const amdata = new Array ("usaCongressionalLow.js");

//function to change w dropdown
function sessionchange(sessionSelect) {
    if ("109th Congress (2005-2007") {
        twitcolor109;
    }
};

// we could also do a heatmap for each state, and a pop up that displays a count of districts with and without twitter - which is easier to code?


//function to highlight if district has a twitter
function twitcolor109(JoinedOn, StateDistID, id) {
    if (JoinedOn > 2005 && JoinedOn < 2008 && StateDistID == id ) {
     console.log("first if")
    }
     console.log("else");
};

//code sourced from https://www.amcharts.com/docs/v4/tutorials/using-us-congressional-districts-maps/

//read in data 
//apply data to the districts within amcharts- how to relate the two?
//style output



