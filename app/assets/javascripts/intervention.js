/**	CONTACT FORM
 *************************************************** **/
var _hash = window.location.hash;

//-------------------------------------------------------------------------
$(".building-class, .battery-class, .column-class, .elevator-class").hide();

///////////////////////////////////////////////////////////////
// Show and hide buildings for customer X
$("#building").prop("disabled", true); // second dropdown is disable while first dropdown is empty

$("#customer").change(function() {
  var customer = $(this).val();
  if (customer == "") {
    $("#building").prop("disabled", true);
  } else {
    $("#building").prop("disabled", false);
  }
  $.ajax({
    url: "/interventions/get_building",
    method: "GET",
    dataType: "json",
    data: { customer: customer },
    error: function(xhr, status, error) {
      console.error("AJAX Error: " + status + error);
    },
    success: function(response) {
      console.log(response);
      var buildings = response["buildings"];
      $("#building").empty();

      $("#building").append("<option>Select Building</option>");
      for (var i = 0; i < buildings.length; i++) {
        $("#building").append(
          '<option value="' +
            buildings[i]["id"] +
            '">' +
            buildings[i]["customer_id"] +
            "</option>"
        );
      }
    }
  });
});

// Show and hide batteries for building X
// $("#building").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#building").change(function() {
  var building = $(this).val();
  if (building == "") {
    $("#battery").prop("disabled", true);
  } else {
    $("#battery").prop("disabled", false);
  }
  $.ajax({
    url: "/interventions/get_battery",
    method: "GET",
    dataType: "json",
    data: { building: building },
    error: function(xhr, status, error) {
      console.error("AJAX Error: " + status + error);
    },
    success: function(response) {
      var batteries = response["batteries"];
      $("#battery").empty();

      $("#battery").append("<option>Select Battery</option>");
      for (var i = 0; i < batteries.length; i++) {
        $("#battery").append(
          '<option value="' +
            batteries[i]["id"] +
            '">' +
            batteries[i]["building_id"] +
            "</option>"
        );
      }
    }
  });
});

// Show and hide columns for battery X
// $("#building").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#battery").change(function() {
  var battery = $(this).val();
  if (battery == "") {
    $("#column").prop("disabled", true);
  } else {
    $("#column").prop("disabled", false);
  }
  $.ajax({
    url: "/interventions/get_column",
    method: "GET",
    dataType: "json",
    data: { battery: battery },
    error: function(xhr, status, error) {
      console.error("AJAX Error: " + status + error);
    },
    success: function(response) {
      var columns = response["columns"];
      $("#column").empty();

      $("#column").append("<option>Select Column</option>");
      for (var i = 0; i < columns.length; i++) {
        $("#column").append(
          '<option value="' +
            columns[i]["id"] +
            '">' +
            columns[i]["battery_id"] +
            "</option>"
        );
      }
    }
  });
});

// Show and hide elevators for column X
// $("#building").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#column").change(function() {
  var column = $(this).val();
  if (column == "") {
    $("#elevator").prop("disabled", true);
  } else {
    $("#elevator").prop("disabled", false);
  }
  $.ajax({
    url: "/interventions/get_elevator",
    method: "GET",
    dataType: "json",
    data: { column: column },
    error: function(xhr, status, error) {
      console.error("AJAX Error: " + status + error);
    },
    success: function(response) {
      var elevators = response["elevators"];
      $("#elevator").empty();

      $("#elevator").append("<option>Select Elevator</option>");
      for (var i = 0; i < elevators.length; i++) {
        $("#elevator").append(
          '<option value="' +
            elevators[i]["id"] +
            '">' +
            elevators[i]["id"] +
            "</option>"
        );
      }
    }
  });
});
// Customer drop down menu
$(document).ready(function() {
  var choice = document.getElementById("customer");
  choice.addEventListener("change", customer);
  choice.addEventListener("change", clear);
});

var customer = function() {
  var choice = document.getElementById("customer").value;
  if (choice != 0) {
    $(".building-class").show();
  }
};

// Building drop down menu
$(document).ready(function() {
  var choice = document.getElementById("building");
  choice.addEventListener("change", building);
  choice.addEventListener("change", clear);
});

var building = function() {
  var choice = document.getElementById("building").value;
  if (choice != 0) {
    $(".battery-class").show();
  }
};

// Battery drop down menu
$(document).ready(function() {
  var choice = document.getElementById("battery");
  choice.addEventListener("change", battery);
  choice.addEventListener("change", clear);
});

var battery = function() {
  var choice = document.getElementById("battery").value;
  if (choice != 0) {
    $(".column-class").show();
  }
};

// Column drop down menu
$(document).ready(function() {
  var choice = document.getElementById("column");
  choice.addEventListener("change", column);
  choice.addEventListener("change", clear);
});

var column = function() {
  var choice = document.getElementById("column").value;
  if (choice != 0) {
    $(".elevator-class").show();
  }
};
//  Main fonction ----------------------------------------------------------------
// check if all inputs are not empty and call the right function for right sector

// var calculMain = function() {
//   $(".form-control-1, .form-control-2, .form-control-3, .form-control-4").each(
//     function() {
//       if ($(this).val() === "") {
//         clearPrice();
//       }
//     }
//   );

//   if (document.getElementById("quote_department").value === "Residential") {
//     if (
//       document.getElementById("resi-app").value !== "" &&
//       document.getElementById("resi-floor").value !== ""
//     ) {
//       var residentiel = calculResi();
//       calculPrix(residentiel);

//       $("input[name='quote[service_level]']").change(function() {
//         if (
//           document.getElementById("resi-app").value !== "" &&
//           document.getElementById("resi-floor").value !== ""
//         ) {
//           calculPrix(residentiel);
//         }
//       });
//     } else {
//       clearPrice();
//     }
//   } else if (
//     document.getElementById("quote_department").value === "Corporate"
//   ) {
//     if (
//       document.getElementById("cor-floor").value !== "" &&
//       document.getElementById("cor-quar").value !== "" &&
//       document.getElementById("cor-occu").value !== ""
//     ) {
//       var corpo = calculCorpo();
//       calculPrix(corpo);

//       $("input[name='quote[service_level]']").change(function() {
//         if (
//           document.getElementById("cor-floor").value !== "" &&
//           document.getElementById("cor-quar").value !== "" &&
//           document.getElementById("cor-occu").value !== ""
//         ) {
//           calculPrix(corpo);
//         }
//       });
//     } else {
//       clearPrice();
//     }
//   } else if (document.getElementById("quote_department").value === "Hybrid") {
//     if (
//       document.getElementById("hyb-floor").value !== "" &&
//       document.getElementById("hyb-quar").value !== "" &&
//       document.getElementById("hyb-occu").value !== ""
//     ) {
//       var corpo = calculCorpo();
//       calculPrix(corpo);

//       $("input[name='quote[service_level]']").change(function() {
//         if (
//           document.getElementById("hyb-floor").value !== "" &&
//           document.getElementById("hyb-quar").value !== "" &&
//           document.getElementById("hyb-occu").value !== ""
//         ) {
//           calculPrix(corpo);
//         }
//       });
//     } else {
//       clearPrice();
//     }
//   } else if (
//     document.getElementById("quote_department").value === "Commercial"
//   ) {
//     if (document.getElementById("com-asce").value !== "") {
//       var comm = calculCommerce();
//       calculPrix(comm);

//       $("input[name='quote[service_level]']").change(function() {
//         if (document.getElementById("com-asce").value !== "") {
//           var comm = calculCommerce();
//           calculPrix(comm);
//         }
//       });
//     } else {
//       clearPrice();
//     }
//   }
// };
// Function that reset all inputs and prices-----------------------------------------------------
var clear = function() {
  $(".form-control-1, .form-control-2, .form-control-3, .form-control-4").each(
    function() {
      $(this).val("");
    }
  );
};

/**
	BROWSER HASH - from php/contact.php redirect!
	#alert_success 		= email sent
	#alert_failed		= email not sent - internal server error (404 error or SMTP problem)
	#alert_mandatory	= email not sent - required fields empty
**/ jQuery(
  _hash
).show();
