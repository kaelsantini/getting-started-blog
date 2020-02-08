$(function(){

  var $_table = $("table");
  var $_ths = $_table.find("th");
  var $_tbody = $_table.find("tbody");

  $("form").on("ajax:complete", function(a, b, c, d){

  });
  /*
  $("form").on("ajax:success", function(ev){
    var users = ev.detail[0].users;

    var _html = "";

    if (users.length == 0) {
      _html += "<tr>>td>No Users</td></tr>";
    }

    for ( var i = 0; i < users.length; i++ ) {
      var user = users[i];
      _html += "<tr>";

      $_ths.each(function(index, el){
        _html += "<td>";
        var _column = $(this).attr("col");
        _html += user[_column];
        _html += "</td>";
      })

      _html += "</tr>";
    }

    $_tbody.find("tr").remove();
    $_tbody.append(_html);

  });
  */
});
