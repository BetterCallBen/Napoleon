import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []
  static values = {}

  submitForm() {
    this.element.submit()
  }

}
