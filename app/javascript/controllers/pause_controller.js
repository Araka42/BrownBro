import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["play", "pause"]

  presspause(click){
    this.playTarget.classList.remove('d-none')
    this.pauseTarget.classList.add('d-none')
  }
}
