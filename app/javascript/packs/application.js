// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { clickArrow, scrollToTop } from "../components/top_scroll";
import { toggleFilter } from "../components/toggle_filter";
import { changeClass } from "../components/toggle_filter";
import { keepCheckedState, clearLocalStorage } from "../components/checkbox_state";
import { toggleMessage } from "../components/toggle_messages";
import { selectedFiles } from "../components/show_selected_files";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  toggleMessage();
  clearLocalStorage();
  keepCheckedState();
  changeClass();
  toggleFilter();
  scrollToTop();
  clickArrow();
  // selectedFiles();
});
