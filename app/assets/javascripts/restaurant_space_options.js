// $('#')

// var spaceOptions = new Array();
// <% for space_option in @space_options -%>
//   states.push(new Array(<%= state.country_id %>, '<%=h state.name %>', <%= state.id %>));
// <% end -%>

// function countrySelected() {
//   country_id = $('person_country_id').getValue();
//   options = $('person_state_id').options;
//   options.length = 1;
//   states.each(function(state) {
//     if (state[0] == country_id) {
//       options[options.length] = new Option(state[1], state[2]);
//     }
//   });
//   if (options.length == 1) {
//     $('state_field').hide();
//   } else {
//     $('state_field').show();
//   }
// }

// document.observe('dom:loaded', function() {
//   countrySelected();
//   $('person_country_id').observe('change', countrySelected);
// });)