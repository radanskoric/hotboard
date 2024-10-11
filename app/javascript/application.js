// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.StreamActions.log = function () {
  console.log(this.getAttribute("message"))
}

addEventListener("turbo:render", (event) => {
  console.log("Turbo Rendered with: ", event.detail.renderMethod);
})
