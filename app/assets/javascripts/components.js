// Manually add components to window and global
// so that react_ujs and react-server can find them and render them.
window.Main = global.Main = require("./components/main.js.jsx").default