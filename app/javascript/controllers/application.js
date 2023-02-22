import { Application } from "@hotwired/stimulus"
import TypedController from "../controllers/typed_controller"

const application = Application.start()
application.register("typed", TypedController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
