import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]

  search() {
    const query = this.inputTarget.value.trim()

    if (query.length >= 2) {
      fetch(`/members/search?q=${query}`)
        .then(res => res.json())
        .then(data => {
          this.suggestionsTarget.innerHTML = ""
          data.forEach(member => {
            const option = document.createElement("option")
            option.value = member.id
            option.textContent = member.name
            this.suggestionsTarget.appendChild(option)
          })
        })
    }
  }
}
