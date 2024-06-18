// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
//Turbo.session.drive = false
import "./controllers"
import preline from "preline/dist/preline"
import "./jquery"
import "clipboard/dist/clipboard.min"
import "clipboard"
import "./onmount"
import "./views"
import "./fewlines"
import "./fancybox"
import "./range-slider"
import "slick-carousel/slick/slick.min.js"
import "./select2_components.js"
import "./jquery-shorten.min.js"
import "./usefull_functions"

import Rails from '@rails/ujs'

Rails.start()

$(document).ready(function () {
    initJs();
})

document.addEventListener('turbo:render', initJs)

function initJs(event) {
    window.onmount();
    HSStaticMethods.autoInit();
}
