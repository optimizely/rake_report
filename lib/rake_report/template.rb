require 'erb'

class RakeReportTemplate
  attr_accessor :colors, :template, :timers
  def initialize(timers)
    @colors = %w(#50ABD2 #78B653 #CAD04F #ED913D #E8182E)
    @template = template
    @timers = timers
  end

  def template
    %q{
    <html>
      <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          var jsonData = <%= timers.to_json %>;

          google.charts.load("current",{packages:["timeline"]});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {
            var dataTable = new google.visualization.DataTable(jsonData);
            var container = document.getElementById('timeline');
            var chart = new google.visualization.Timeline(container);

            // If the number of rows exceeds the length of the color array
            // the chart shows every row with the same color. This is prettier.
            var color_palatte = <%= colors.to_json %>;
            var colors = new Array();
            for(var i=0; i < dataTable.getNumberOfRows(); i++) {
              colors.push(color_palatte[i % color_palatte.length]);
            }
            var options = {
              colors: colors,
              timeline: {
                showBarLabels: false,
                colorByRowLabel: true,
                groupByRowLabel: true
              }
            };

            chart.draw(dataTable, options);
          }
        </script>
      </head>
      <body>
        <div id="timeline" style="height: 100%"></div>
      </body>
    </html>
    }
  end

  def render
    ERB.new(@template).result(binding)
  end

  def save(file)
    File.open(file, 'w') do |f|
      f.write(render)
    end
  end
end
