import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["container"]

    add(event) {
        const template = this.containerTarget.querySelector('.step-field').cloneNode(true)
        const stepCount = this.containerTarget.children.length + 1

        //update placeholder
        const input = template.querySelector('input')
        input.value = ''
        input.placeholder = `Step ${stepCount}`

        this.containerTarget.appendChild(template)
    }
}