// import the CSS so that webpack will load it.
// MiniCSSExtractPlugin separates it out into its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your entrypoints
// The entry points can be configured in "webpack.config.js"
// 
// Import dependencies
import "phoenix_html"

// Import local files
// 
// Local files can be imported directly using relative paths, ex:
// import socket from "./socket"

import LiveSocket from "phoenix_live_view"

let liveSocket = new LiveSocket("/live")
LiveSocket.connect()