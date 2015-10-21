$( document ).ready(function() {

  var width = 800,
      height = 900,
      radius = Math.min(width, height) / 2;

  var x = d3.scale.linear()
      .range([0, 2 * Math.PI]); // this goes into detail on why it is 2 * pi http://tauday.com/tau-manifesto

  var y = d3.scale.sqrt() //makes growth sub-linear along a range of 0 - radius
      .range([0, radius]);

  var color = d3.scale.category20c();

  var svg = d3.select("#body").append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g") // Child SVG Element, i.e., the track
      .attr("transform", "translate(" + width * 2 + "," + (height / 2 + 10) + ")"); // LOOK THESE UP

  var partition = d3.layout.partition() // sets the partition mapping hierarchy
      .value(function(d) { return d.value; }); //LOOK THIS UP



  var arc = d3.svg.arc()
      .startAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
      .endAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
      .innerRadius(function(d) { return Math.max(0, y(d.y)); }) // from center to edge
      .outerRadius(function(d) { return Math.max(0, y(d.y + d.dy)); }); // from outer edge


    var tooltip = d3.select("#body")
      .append("div")
      .attr("class", "tooltip")
      .style("position", "absolute")
      .style("z-index", "10")
      .style("opacity", 0);

      function format_number(x) {
         return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); //removes "," from numbers
       }


    function format_name(d) {
      var name = d.name;
        return  '<b> Track Name: ' + name + '</b><br> <b> Artist Name: Biggie Smalls </b><br><b>Sampled By: '  + format_number(d.value);
    }


  d3.json("sample.json", function(error, root) { //error is not called anywhere else and it runs fine without it

    var path = svg.selectAll("path") //paths identify the individual elements
        .data(partition.nodes(root)) //this maps out each node that descends from the root
        .enter().append("path")
        .attr("d", arc)
        .style("fill", function(d) { return color((d.children ? d : d.parent).name); })
        .on("click", click)
         .on("mouseover", function(d) {
            tooltip.html(function() {
                return format_name(d);
                // next two lines were in the original code base -- cut themout in favor of above line
                //var name = format_name(d);
                // return name;
           });
            return tooltip.transition()
              .duration(100)
              .style("opacity", 0.9);
          })
          .on("mousemove", function(d) {
            return tooltip
              .style("top", (d3.event.pageY-10)+"px")
              .style("left", (d3.event.pageX+10)+"px");
          })
          .on("mouseout", function(){return tooltip.style("opacity", 0);});



    function click(d) {
      path.transition()
        .duration(1750)
        .attrTween("d", arcTween(d));
    }
  });

  d3.select(self.frameElement).style("height", height + "px");

  // Interpolate the scales!
  function arcTween(d) {
    var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
        yd = d3.interpolate(y.domain(), [d.y, 1]),
        yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius]);
    return function(d, i) {
      return i
          ? function(t) { return arc(d); }
          : function(t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); return arc(d); };
    };
  }
  });
